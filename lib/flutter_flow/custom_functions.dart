import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isValidemail(String email) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  return passwordRegex.hasMatch(password);
}

List<dynamic> mergeAndDedup(
  List<dynamic>? a,
  List<dynamic>? b,
) {
  final seen = <String>{};
  final result = [];

  final listA = a ?? [];
  final listB = b ?? [];

  // 키워드 검색 결과
  for (final item in listA) {
    final roadAddress = item['road_address_name'] ?? item['address_name'];
    if (roadAddress != null && !seen.contains(roadAddress)) {
      seen.add(roadAddress);
      result.add({
        'road_address_name': item['road_address_name'] ?? '',
        'address_name': item['address_name'] ?? '',
        'x': item['x'],
        'y': item['y'],
      });
    }
  }

  // 주소 검색 결과
  for (final item in listB) {
    final address = item['address'];
    final road = item['road_address'];
    if (address == null && road == null) continue;

    final roadAddress =
        road != null ? road['address_name'] : address['address_name'];
    if (roadAddress != null && !seen.contains(roadAddress)) {
      seen.add(roadAddress);
      result.add({
        'road_address_name': road?['address_name'] ?? '',
        'address_name': address?['address_name'] ?? '',
        'x': address?['x'] ?? road?['x'],
        'y': address?['y'] ?? road?['y'],
      });
    }
  }

  return result;
}

bool? shouldShowAddressItem(dynamic item) {
  final map = item as Map<String, dynamic>;

  final road = map['road_address_name'];
  final addr = map['address_name'];

  return (road != null && road.toString().trim() != '') &&
      (addr != null && addr.toString().trim() != '');
}

List<String> subCategories(
  String mainCategory,
  String language,
) {
  final subCategoriesMap = {
    "ko": {
      '육류·생선': ['전체', '소고기', '닭고기', '양고기', '가공육', '해산물', '기타'],
      '채소·과일': ['전체', '채소', '과일', '콩·두류', '기타'],
      '가공식품': ['전체', '라면·면류', '즉석식품', '통조림', '소스·양념', '향신료', '곡물', '기타'],
      '유제품': ['전체', '우유', '치즈', '요거트', '버터', '계란', '기타'],
      '스낵·음료': ['전체', '과자', '초콜릿', '견과류', '음료', '차', '기타'],
    },
    "en": {
      'Meat': [
        'All',
        'Beef',
        'Chicken',
        'Lamb',
        'Processed',
        'Seafood',
        'Other'
      ],
      'Veggie': ['All', 'Vegetables', 'Fruits', 'Beans', 'Other'],
      'Grocery': [
        'All',
        'Noodles',
        'Ready Meals',
        'Canned',
        'Sauce',
        'Spice',
        'Grains',
        'Other'
      ],
      'Dairy': ['All', 'Milk', 'Cheese', 'Yogurt', 'Butter', 'Eggs', 'Other'],
      'Snack': ['All', 'Snacks', 'Chocolate', 'Nuts', 'Drinks', 'Tea', 'Other'],
    },
    "id": {
      'Daging': [
        'Semua',
        'Sapi',
        'Ayam',
        'Domba',
        'Olahan',
        'Makanan Laut',
        'Lainnya'
      ],
      'Sayur': ['Semua', 'Sayuran', 'Buah', 'Kacang-kacangan', 'Lainnya'],
      'Grocery': [
        'Semua',
        'Mie',
        'Makanan Siap Saji',
        'Kaleng',
        'Saus',
        'Bumbu',
        'Biji-bijian',
        'Lainnya'
      ],
      'Susu': [
        'Semua',
        'Susu',
        'Keju',
        'Yogurt',
        'Mentega',
        'Telur',
        'Lainnya'
      ],
      'Camil': [
        'Semua',
        'Camilan',
        'Cokelat',
        'Kacang',
        'Minuman',
        'Teh',
        'Lainnya'
      ],
    },
    "bn": {
      'মাংস': ['সব', 'গরু', 'মুরগি', 'খাসি', 'প্রসেসড', 'সীফুড', 'অন্যান্য'],
      'সবজি': ['সব', 'সবজি', 'ফল', 'ডাল', 'অন্যান্য'],
      'মুদিখানা': [
        'সব',
        'নুডলস',
        'রেডি খাবার',
        'ক্যানড',
        'সস',
        'মসলা',
        'শস্য',
        'অন্যান্য'
      ],
      'দুগ্ধ': ['সব', 'দুধ', 'চিজ', 'দই', 'মাখন', 'ডিম', 'অন্যান্য'],
      'স্ন্যাকস': [
        'সব',
        'স্ন্যাকস',
        'চকলেট',
        'বাদাম',
        'পানীয়',
        'চা',
        'অন্যান্য'
      ],
    },
  };

  // 안전하게 fallback 처리
  final mapForLang = subCategoriesMap[language] ?? subCategoriesMap['ko']!;
  return mapForLang[mainCategory] ?? [];
}

String formatPrice(int? price) {
  if (price == null) return '0원';

  final str = price.floor().toString();
  final formatted = str.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (match) => '${match.group(1)},',
  );

  return '$formatted원';
}

List<String> getAllImages(
  String mainImage,
  List<String> images,
) {
  return [mainImage, ...images];
}

String formatDiscountRate(int rate) {
  return '$rate%';
}

int calculateTotal(List<int> subtotal) {
  return subtotal.fold(0, (sum, item) => sum + item);
}

String getCheckoutUrl(
  String orderId,
  String userId,
) {
  return "https://hallie-5c03d.web.app/checkout.html?userId=$userId&orderId=$orderId";
}

DocumentReference userRef(String uid) {
  return FirebaseFirestore.instance.collection('users').doc(uid);
}

String generateOrderId() {
  final now = DateTime.now();
  final date =
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}';
  final random = now.millisecondsSinceEpoch.toString().substring(8); // 5자리 정도
  return '$date-$random';
}

String formatDateTime(String? paidAt) {
  //
  if (paidAt == null || paidAt.length < 10) return '';

  final result = paidAt.substring(0, 10).replaceAll('-', '.');
  return result;
}

DocumentReference productRef(String productId) {
  return FirebaseFirestore.instance.collection('products').doc(productId);
}

String? deliveryDetailUrl(
  String deliverycode,
  String deliverynumber,
  String tkey,
) {
  return 'https://info.sweettracker.co.kr/tracking/5?t_code=$deliverycode&t_invoice=$deliverynumber&t_key=$tkey';
}

String getToday() {
  final now = DateTime.now();
  return "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
}

double calculateNewAverage(
  double avgRating,
  int reviewCount,
  double rating,
) {
  return (avgRating * reviewCount + rating) / (reviewCount + 1);
}

double calculateUpdatedAverage(
  double avgRating,
  int reviewCount,
  double oldRating,
  double newRating,
) {
  return (avgRating * reviewCount - oldRating + newRating) / reviewCount;
}

DocumentReference? sellerRef(String uid) {
  return FirebaseFirestore.instance.collection('sellers').doc(uid);
}

List<String> maincategories(String language) {
  switch (language) {
    case "en":
      return [
        'Meat',
        'Veggie',
        'Grocery',
        'Dairy',
        'Snack',
      ];

    case "id": // Indonesian
      return [
        'Daging',
        'Sayur',
        'Grocery',
        'Susu',
        'Camil',
      ];

    case "bn": // Bengali
      return [
        'মাংস',
        'সবজি',
        'মুদিখানা',
        'দুগ্ধ',
        'স্ন্যাকস',
      ];

    case "ko":
    default:
      return [
        '육류·생선',
        '채소·과일',
        '가공식품',
        '유제품',
        '스낵·음료',
      ];
  }
}

DocumentReference reviewRef(
  String productId,
  String reviewId,
) {
  return FirebaseFirestore.instance
      .collection('products')
      .doc(productId)
      .collection('reviews')
      .doc(reviewId);
}

DocumentReference orderRef(
  String userId,
  String orderId,
) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('orders')
      .doc(orderId);
}

DocumentReference pointsRef(
  String userId,
  String pointId,
) {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('points')
      .doc(pointId);
}

String hourAndMinute(String? paidAt) {
  //
  if (paidAt == null || paidAt.length < 16) return '';

  final result = paidAt.substring(0, 16).replaceAll('-', '.');
  return result;
}

int getCommentLength(String comment) {
  return comment.length;
}

double? getPercent(
  int? part,
  int? total,
) {
  if (part == null || total == null || part == 0 || total == 0) return 0.0;
  return part / total;
}

String maskName(String name) {
  if (name.trim().isEmpty) return '';

  final trimmedName = name.trim();

  // ===== 한글 이름 처리 =====
  final koreanReg = RegExp(r'^[가-힣]+$');
  if (koreanReg.hasMatch(trimmedName)) {
    if (trimmedName.length == 1) {
      return '*';
    } else if (trimmedName.length == 2) {
      return '${trimmedName[0]}*';
    } else {
      return '${trimmedName[0]}${'*' * (trimmedName.length - 2)}${trimmedName[trimmedName.length - 1]}';
    }
  }

  // ===== 영문 이름 처리 (공백 포함) =====
  final englishReg = RegExp(r'^[a-zA-Z\s]+$');
  if (englishReg.hasMatch(trimmedName)) {
    final parts = trimmedName.split(RegExp(r'\s+')).where((e) => e.isNotEmpty);

    return parts.map((p) {
      if (p.length == 1) {
        return '*';
      } else if (p.length <= 3) {
        return '${p[0]}*';
      } else {
        return '${p.substring(0, 3)}${'*' * (p.length - 3)}';
      }
    }).join(' ');
  }

  // ===== 그 외 문자 (숫자/특수문자 혼합) =====
  if (trimmedName.length == 1) {
    return '*';
  }

  return '${trimmedName[0]}${'*' * (trimmedName.length - 1)}';
}

double floorRating(double? rating) {
  if (rating == null || rating == 0) return 0.0; // ✅ 0 또는 null 방지
  return (rating * 10).floorToDouble() / 10;
}

double calculateAverageOnDelete(
  double avgRating,
  int reviewCount,
  double ratingToRemove,
) {
  if (reviewCount <= 1) return 0.0; // 삭제 후 리뷰가 없으면 0
  return (avgRating * reviewCount - ratingToRemove) / (reviewCount - 1);
}

int calculatePoints(int totalAmount) {
  if (totalAmount <= 0) {
    return 0;
  }

  // 2% 포인트 적립 (소수점 버림)
  final points = (totalAmount * 0.02).floor();

  return points;
}

DateTime getExpiresAtPlus30Days() {
  return DateTime.now().add(const Duration(days: 30));
}

List<dynamic> kMFList(
  List<dynamic> data,
  String certNo,
) {
  final query = certNo.toLowerCase();

  // 인증번호로 해당 row 찾기
  final filtered = data.where((row) {
    if (row.isEmpty) return false;
    final cert = row.length > 8 ? row[8].toString().toLowerCase() : '';
    return cert.contains(query);
  }).toList();

  if (filtered.isEmpty) {
    return [
      '', // 회사명 한글
      '', // 회사명 영어
      '', // 상품목록 한글
      '', // 상품목록 영어
      '', // 상품 수
      '', // 인증기간
      '', // 인증번호
      '', // 할랄 인증서
    ];
  }

  final row = filtered[0];

  // 회사명
  final companyKR = row.length > 1 ? row[1].toString() : '';
  final companyEN = row.length > 2 ? row[2].toString() : '';

  // 상품목록
  final productsKR = row.length > 4 && row[4] != null
      ? row[4].toString().split(',').map((e) => e.trim()).join(', ')
      : '';

  final productsEN = row.length > 5 && row[5] != null
      ? row[5].toString().split(',').map((e) => e.trim()).join(', ')
      : '';

  // 상품 수
  final productsNum = row.length > 3 ? row[3].toString() : '';

  // 인증기간
  final issueValid = row.length > 7 ? row[7].toString() : '';

  // 인증번호
  final certNoVal = row.length > 8 ? row[8].toString() : '';

  // 할랄 인증서
  final halalCertImage = row.length > 9 ? row[9].toString() : '';

  return [
    companyKR, // 회사명 한글
    companyEN, // 회사명 영어
    productsKR, // 상품목록 한글
    productsEN, // 상품목록 영어
    productsNum, // 상품 수
    issueValid, // 인증기간
    certNoVal, // 인증번호
    halalCertImage, // 할랄 인증서
  ];
}

String mainCategory(
  String ko,
  String language,
) {
  const map = {
    '육류·생선': {
      'en': 'Meat',
      'id': 'Daging',
      'bn': 'মাংস',
    },
    '채소·과일': {
      'en': 'Veggie',
      'id': 'Sayur',
      'bn': 'সবজি',
    },
    '가공식품': {
      'en': 'Grocery',
      'id': 'Grocery',
      'bn': 'মুদিখানা',
    },
    '유제품': {
      'en': 'Dairy',
      'id': 'Susu',
      'bn': 'দুগ্ধ',
    },
    '스낵·음료': {
      'en': 'Snack',
      'id': 'Camil',
      'bn': 'স্ন্যাকস',
    },
  };

  return map[ko]?[language] ?? ko;
}

List<String>? splitImages(String? image) {
  if (image == null || image.trim().isEmpty) {
    return [];
  }

  return image
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}

String maincategoryToKo(String value) {
  const map = {
    // =================
    // 메인 카테고리 → 한국어
    // =================
    'Meat': '육류·생선',
    'Daging': '육류·생선',
    'মাংস': '육류·생선',
    '육류·생선': '육류·생선',

    'Veggie': '채소·과일',
    'Sayur': '채소·과일',
    'সবজি': '채소·과일',
    '채소·과일': '채소·과일',

    'Grocery': '가공식품',
    'মুদিখানা': '가공식품',
    '가공식품': '가공식품',

    'Dairy': '유제품',
    'Susu': '유제품',
    'দুগ্ধ': '유제품',
    '유제품': '유제품',

    'Snack': '스낵·음료',
    'Camil': '스낵·음료',
    'স্ন্যাকস': '스낵·음료',
    '스낵·음료': '스낵·음료',
  };

  return map[value] ?? value; // 없으면 입력 그대로 반환
}

String subCategoryToLanguage(
  String koSubCategory,
  String language,
) {
  const map = {
    // ===== 공통 =====
    '전체': {
      'en': 'All',
      'id': 'Semua',
      'bn': 'সব',
    },
    '기타': {
      'en': 'Other',
      'id': 'Lainnya',
      'bn': 'অন্যান্য',
    },

    // ===== 육류·생선 =====
    '소고기': {
      'en': 'Beef',
      'id': 'Sapi',
      'bn': 'গরু',
    },
    '닭고기': {
      'en': 'Chicken',
      'id': 'Ayam',
      'bn': 'মুরগি',
    },
    '양고기': {
      'en': 'Lamb',
      'id': 'Domba',
      'bn': 'খাসি',
    },
    '가공육': {
      'en': 'Processed',
      'id': 'Olahan',
      'bn': 'প্রসেসড',
    },
    '해산물': {
      'en': 'Seafood',
      'id': 'Makanan Laut',
      'bn': 'সীফুড',
    },

    // ===== 채소·과일 =====
    '채소': {
      'en': 'Vegetables',
      'id': 'Sayuran',
      'bn': 'সবজি',
    },
    '과일': {
      'en': 'Fruits',
      'id': 'Buah',
      'bn': 'ফল',
    },
    '콩·두류': {
      'en': 'Beans',
      'id': 'Kacang-kacangan',
      'bn': 'ডাল',
    },

    // ===== 가공식품 =====
    '라면·면류': {
      'en': 'Noodles',
      'id': 'Mie',
      'bn': 'নুডলস',
    },
    '즉석식품': {
      'en': 'Ready Meals',
      'id': 'Makanan Siap Saji',
      'bn': 'রেডি খাবার',
    },
    '통조림': {
      'en': 'Canned',
      'id': 'Kaleng',
      'bn': 'ক্যানড',
    },
    '소스·양념': {
      'en': 'Sauce',
      'id': 'Saus',
      'bn': 'সস',
    },
    '향신료': {
      'en': 'Spice',
      'id': 'Bumbu',
      'bn': 'মসলা',
    },
    '곡물': {
      'en': 'Grains',
      'id': 'Biji-bijian',
      'bn': 'শস্য',
    },

    // ===== 유제품 =====
    '우유': {
      'en': 'Milk',
      'id': 'Susu',
      'bn': 'দুধ',
    },
    '치즈': {
      'en': 'Cheese',
      'id': 'Keju',
      'bn': 'চিজ',
    },
    '요거트': {
      'en': 'Yogurt',
      'id': 'Yogurt',
      'bn': 'দই',
    },
    '버터': {
      'en': 'Butter',
      'id': 'Mentega',
      'bn': 'মাখন',
    },
    '계란': {
      'en': 'Eggs',
      'id': 'Telur',
      'bn': 'ডিম',
    },

    // ===== 스낵·음료 =====
    '과자': {
      'en': 'Snacks',
      'id': 'Camilan',
      'bn': 'স্ন্যাকস',
    },
    '초콜릿': {
      'en': 'Chocolate',
      'id': 'Cokelat',
      'bn': 'চকলেট',
    },
    '견과류': {
      'en': 'Nuts',
      'id': 'Kacang',
      'bn': 'বাদাম',
    },
    '음료': {
      'en': 'Drinks',
      'id': 'Minuman',
      'bn': 'পানীয়',
    },
    '차': {
      'en': 'Tea',
      'id': 'Teh',
      'bn': 'চা',
    },
  };

  return map[koSubCategory]?[language] ?? koSubCategory;
}

String subcategoryToKo(String value) {
  const map = {
    // ===== 공통 =====
    'All': '전체',
    '전체': '전체',
    'Semua': '전체',
    'সব': '전체',

    // ===== 육류·생선 =====
    'Beef': '소고기',
    'Sapi': '소고기',
    'গরু': '소고기',
    '소고기': '소고기',

    'Chicken': '닭고기',
    'Ayam': '닭고기',
    'মুরগি': '닭고기',
    '닭고기': '닭고기',

    'Lamb': '양고기',
    'Domba': '양고기',
    'খাসি': '양고기',
    '양고기': '양고기',

    'Processed': '가공육',
    'Olahan': '가공육',
    'প্রসেসড': '가공육',
    '가공육': '가공육',

    'Seafood': '해산물',
    'Makanan Laut': '해산물',
    'সীফুড': '해산물',
    '해산물': '해산물',

    // ===== 채소·과일 =====
    'Vegetables': '채소',
    'Sayur': '채소',
    'সবজি': '채소',
    '채소': '채소',

    'Fruits': '과일',
    'Buah': '과일',
    'ফল': '과일',
    '과일': '과일',

    'Beans': '콩·두류',
    'Kacang-kacangan': '콩·두류',
    'ডাল': '콩·두류',
    '콩·두류': '콩·두류',

    // ===== 가공식품 =====
    'Noodles': '라면·면류',
    'Mie': '라면·면류',
    'নুডলস': '라면·면류',
    '라면·면류': '라면·면류',

    'Ready Meals': '즉석식품',
    'Makanan Siap Saji': '즉석식품',
    'রেডি খাবার': '즉석식품',
    '즉석식품': '즉석식품',

    'Canned': '통조림',
    'Kaleng': '통조림',
    'ক্যানড': '통조림',
    '통조림': '통조림',

    'Sauce': '소스·양념',
    'Saus': '소스·양념',
    'সস': '소스·양념',
    '소스·양념': '소스·양념',

    'Spice': '향신료',
    'Bumbu': '향신료',
    'মসলা': '향신료',
    '향신료': '향신료',

    'Grains': '곡물',
    'Biji-bijian': '곡물',
    'শস্য': '곡물',
    '곡물': '곡물',

    // ===== 유제품 =====
    'Milk': '우유',
    'Susu': '우유',
    'দুধ': '우유',
    '우유': '우유',

    'Cheese': '치즈',
    'Keju': '치즈',
    'চিজ': '치즈',
    '치즈': '치즈',

    'Yogurt': '요거트',
    'দই': '요거트',
    '요거트': '요거트',

    'Butter': '버터',
    'Mentega': '버터',
    'মাখন': '버터',
    '버터': '버터',

    'Eggs': '계란',
    'Telur': '계란',
    'ডিম': '계란',
    '계란': '계란',

    // ===== 스낵·음료 =====
    'Snacks': '과자',
    'Camilan': '과자',
    'স্ন্যাকস': '과자',
    '과자': '과자',

    'Chocolate': '초콜릿',
    'Cokelat': '초콜릿',
    'চকলেট': '초콜릿',
    '초콜릿': '초콜릿',

    'Nuts': '견과류',
    'Kacang': '견과류',
    'বাদাম': '견과류',
    '견과류': '견과류',

    'Drinks': '음료',
    'Minuman': '음료',
    'পানীয়': '음료',
    '음료': '음료',

    'Tea': '차',
    'Teh': '차',
    'চা': '차',
    '차': '차',

    // ===== 기타 =====
    'Other': '기타',
    'Lainnya': '기타',
    'অন্যান্য': '기타',
    '기타': '기타',
  };

  return map[value] ?? value;
}

DateTime startToday() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime startTomorrow() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 1);
}

LatLng latlng(
  double lat,
  double lng,
) {
  return LatLng(lat, lng);
}

List<String> cities(String region) {
  switch (region) {
    /// ===== 서울 =====
    case "서울특별시":
      return [
        "전체",
        "강남구",
        "강동구",
        "강북구",
        "강서구",
        "관악구",
        "광진구",
        "구로구",
        "금천구",
        "노원구",
        "도봉구",
        "동대문구",
        "동작구",
        "마포구",
        "서대문구",
        "서초구",
        "성동구",
        "성북구",
        "송파구",
        "양천구",
        "영등포구",
        "용산구",
        "은평구",
        "종로구",
        "중구",
        "중랑구"
      ];

    /// ===== 경기도 =====
    case "경기도":
      return [
        "전체",
        "가평군",
        "고양시",
        "과천시",
        "광명시",
        "광주시",
        "구리시",
        "군포시",
        "김포시",
        "남양주시",
        "동두천시",
        "부천시",
        "성남시",
        "수원시",
        "시흥시",
        "안산시",
        "안성시",
        "안양시",
        "양주시",
        "양평군",
        "여주시",
        "연천군",
        "오산시",
        "용인시",
        "의왕시",
        "의정부시",
        "이천시",
        "파주시",
        "평택시",
        "포천시",
        "하남시",
        "화성시"
      ];

    /// ===== 부산 =====
    case "부산광역시":
      return [
        "전체",
        "강서구",
        "금정구",
        "기장군",
        "남구",
        "동구",
        "동래구",
        "부산진구",
        "북구",
        "사상구",
        "사하구",
        "서구",
        "수영구",
        "연제구",
        "영도구",
        "중구",
        "해운대구"
      ];

    /// ===== 대구 =====
    case "대구광역시":
      return ["전체", "군위군", "남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"];

    /// ===== 인천 =====
    case "인천광역시":
      return [
        "전체",
        "강화군",
        "계양구",
        "남동구",
        "동구",
        "미추홀구",
        "부평구",
        "서구",
        "연수구",
        "옹진군",
        "중구"
      ];

    /// ===== 광주 =====
    case "광주광역시":
      return ["전체", "광산구", "남구", "동구", "북구", "서구"];

    /// ===== 대전 =====
    case "대전광역시":
      return ["전체", "대덕구", "동구", "서구", "유성구", "중구"];

    /// ===== 울산 =====
    case "울산광역시":
      return ["전체", "남구", "동구", "북구", "중구", "울주군"];

    /// ===== 세종 =====
    case "세종특별자치시":
      return ["전체"];

    /// ===== 제주 =====
    case "제주특별자치도":
      return ["전체", "제주시", "서귀포시"];

    /// ===== 충청북도 =====
    case "충청북도":
      return [
        "전체",
        "괴산군",
        "단양군",
        "보은군",
        "영동군",
        "옥천군",
        "음성군",
        "제천시",
        "증평군",
        "진천군",
        "청주시",
        "충주시"
      ];

    /// ===== 충청남도 =====
    case "충청남도":
      return [
        "전체",
        "계룡시",
        "공주시",
        "금산군",
        "논산시",
        "당진시",
        "보령시",
        "부여군",
        "서산시",
        "서천군",
        "아산시",
        "예산군",
        "천안시",
        "청양군",
        "태안군",
        "홍성군"
      ];

    /// ===== 강원특별자치도 =====
    case "강원특별자치도":
      return [
        "전체",
        "강릉시",
        "고성군",
        "동해시",
        "삼척시",
        "속초시",
        "양구군",
        "양양군",
        "영월군",
        "원주시",
        "인제군",
        "정선군",
        "철원군",
        "춘천시",
        "태백시",
        "평창군",
        "홍천군",
        "화천군",
        "횡성군"
      ];

    /// ===== 전라북도 =====
    case "전라북도":
      return [
        "전체",
        "고창군",
        "군산시",
        "김제시",
        "남원시",
        "무주군",
        "부안군",
        "순창군",
        "완주군",
        "익산시",
        "임실군",
        "장수군",
        "전주시",
        "정읍시",
        "진안군"
      ];

    /// ===== 전라남도 =====
    case "전라남도":
      return [
        "전체",
        "강진군",
        "고흥군",
        "곡성군",
        "광양시",
        "구례군",
        "나주시",
        "담양군",
        "목포시",
        "무안군",
        "보성군",
        "순천시",
        "신안군",
        "여수시",
        "영광군",
        "영암군",
        "완도군",
        "장성군",
        "장흥군",
        "진도군",
        "함평군",
        "화순군",
        "해남군"
      ];

    default:
      return [];
  }
}

String placeUrl(
  String photoName,
  String apiKey,
) {
  if (photoName.isEmpty) return '';

  return 'https://places.googleapis.com/v1/'
      '$photoName/media'
      '?key=$apiKey'
      '&maxWidthPx=800';
}

String regiongroup(String address) {
  final parts = address.split(' ');

  for (final part in parts) {
    if (part.endsWith('도') ||
        part.endsWith('광역시') ||
        part.endsWith('특별시') ||
        part.endsWith('특별자치도') ||
        part.endsWith('특별자치시')) {
      return part;
    }
  }

  return '';
}

String regiondetail(String address) {
  final parts = address.split(' ');

  for (int i = 0; i < parts.length - 1; i++) {
    // 도 / 광역시 / 특별시 / 자치도 찾고
    if (parts[i].endsWith('도') ||
        parts[i].endsWith('광역시') ||
        parts[i].endsWith('특별시') ||
        parts[i].endsWith('특별자치도') ||
        parts[i].endsWith('특별자치시')) {
      final next = parts[i + 1];

      // 시 / 군 / 구만 반환
      if (next.endsWith('시') || next.endsWith('군') || next.endsWith('구')) {
        return next;
      }
    }
  }

  return '';
}

List<String> regions() {
  return [
    "서울특별시",
    "경기도",
    "부산광역시",
    "대구광역시",
    "인천광역시",
    "광주광역시",
    "대전광역시",
    "울산광역시",
    "세종특별자치시",
    "제주특별자치도",
    "강원특별자치도",
    "충청북도",
    "충청남도",
    "전라북도",
    "전라남도",
  ];
}

double calculateDistance(
  double lat1,
  double lon1,
  double lat2,
  double lon2,
) {
  const double earthRadiusKm = 6371;
  const double piDiv180 = 0.017453292519943295;

  final double dLat = (lat2 - lat1) * piDiv180;
  final double dLon = (lon2 - lon1) * piDiv180;

  final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1 * piDiv180) *
          math.cos(lat2 * piDiv180) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final double distance = earthRadiusKm * c;

  // 소수점 1자리 반올림
  return (distance * 10).round() / 10;
}

double lat(LatLng latlng) {
  return latlng.latitude;
}

double lng(LatLng latlng) {
  return latlng.longitude;
}

dynamic calculateBoundingBox(
  double centerLat,
  double centerLng,
  double radiusKm,
) {
  const double earthRadiusKm = 6371;
  const double degPerRad = 57.29577951308232; // 180 / pi
  const double piDiv180 = 0.017453292519943295; // pi / 180

  final double latDelta = (radiusKm / earthRadiusKm) * degPerRad;
  final double lngDelta =
      (radiusKm / earthRadiusKm) * degPerRad / math.cos(centerLat * piDiv180);

  return jsonDecode(jsonEncode({
    'minLat': (centerLat - latDelta),
    'maxLat': (centerLat + latDelta),
    'minLng': (centerLng - lngDelta),
    'maxLng': (centerLng + lngDelta),
  }));
}

String translateWeekdays(
  List<String>? weekdayDescriptions,
  String langCode,
) {
  if (weekdayDescriptions == null || weekdayDescriptions.isEmpty) {
    return ""; // 입력값 없으면 빈 문자열
  }
  Map<String, Map<String, String>> weekdayMaps = {
    'ko': {
      "월요일": "월요일",
      "화요일": "화요일",
      "수요일": "수요일",
      "목요일": "목요일",
      "금요일": "금요일",
      "토요일": "토요일",
      "일요일": "일요일",
    },
    'en': {
      "월요일": "Monday",
      "화요일": "Tuesday",
      "수요일": "Wednesday",
      "목요일": "Thursday",
      "금요일": "Friday",
      "토요일": "Saturday",
      "일요일": "Sunday",
    },
    'id': {
      "월요일": "Senin",
      "화요일": "Selasa",
      "수요일": "Rabu",
      "목요일": "Kamis",
      "금요일": "Jumat",
      "토요일": "Sabtu",
      "일요일": "Minggu",
    },
    'bn': {
      "월요일": "সোমবার",
      "화요일": "মঙ্গলবার",
      "수요일": "বুধবার",
      "목요일": "বৃহস্পতিবার",
      "금요일": "শুক্রবার",
      "토요일": "শনিবার",
      "일요일": "রবিবার",
    },
  };

  final map = weekdayMaps[langCode] ?? weekdayMaps['ko']!;

  // 요일 변환
  List<String> translated = weekdayDescriptions.map((line) {
    String day = line.split(":")[0];
    String rest = line.substring(line.indexOf(":"));
    return "${map[day]}$rest";
  }).toList();

  // 하나의 문자열로 반환, 줄바꿈 포함
  return translated.join('\n');
}

bool? isMapEmpty(dynamic input) {
  return input.isEmpty;
}
