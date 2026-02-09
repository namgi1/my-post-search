import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ko', 'en', 'id', 'bn'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? koText = '',
    String? enText = '',
    String? idText = '',
    String? bnText = '',
  }) =>
      [koText, enText, idText, bnText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '9gthhhsd': {
      'ko': 'Hallie 설치하고 앱 전용 혜택 받기!',
      'bn': 'Hallie ইনস্টল করুন এবং সুবিধা পান!',
      'en': 'Install Hallie & get benefits!',
      'id': 'Instal Hallie & dapatkan benefit!',
    },
    'h57hfn2j': {
      'ko': '앱 설치 >',
      'bn': 'ইনস্টল >',
      'en': 'Install >',
      'id': 'Instal >',
    },
    'uhsyyo62': {
      'ko': 'Search...',
      'bn': '',
      'en': '',
      'id': '',
    },
    'wztm5kyf': {
      'ko': '한국어',
      'bn': '한국어',
      'en': '한국어',
      'id': '한국어',
    },
    'sfcxs5be': {
      'ko': 'English',
      'bn': 'English',
      'en': 'English',
      'id': 'English',
    },
    'xmpcpsqe': {
      'ko': 'Indonesian',
      'bn': 'Indonesian',
      'en': 'Indonesian',
      'id': 'Indonesian',
    },
    '0ikv3yfx': {
      'ko': 'বাংলা',
      'bn': 'বাংলা',
      'en': 'বাংলা',
      'id': 'বাংলা',
    },
    'bk7ukkzq': {
      'ko': '검색어를 입력하세요!',
      'bn': 'অনুসন্ধান শব্দ লিখুন!',
      'en': 'Please enter your search term!',
      'id': 'Masukkan kata kunci',
    },
    'kk68go54': {
      'ko': '육류 · 생선',
      'bn': 'মাংস',
      'en': 'Meat',
      'id': 'Daging',
    },
    'uqza2qr7': {
      'ko': '채소 · 과일',
      'bn': 'সীফুড',
      'en': 'Seafood',
      'id': 'Seafood',
    },
    '8qz4wtyz': {
      'ko': '가공식품',
      'bn': 'দুগ্ধ',
      'en': 'Dairy',
      'id': 'Susu',
    },
    'cnlw1eb7': {
      'ko': '유제품',
      'bn': 'রুটি',
      'en': 'Bakery',
      'id': 'Roti',
    },
    '1mvovjsy': {
      'ko': '스낵 · 음료',
      'bn': 'মসলা',
      'en': 'Spices',
      'id': 'Bumbu',
    },
    'bmlyt1nu': {
      'ko': '놓치면 후회! 인기 특가 모음',
      'bn': 'হট ডিল! মিস করবেন না!',
      'en': 'Hot deals! Don\'t miss out!',
      'id': 'Penawaran!',
    },
    '9eangca9': {
      'ko': '더보기 >',
      'bn': 'আরও দেখুন >',
      'en': 'See more >',
      'id': 'Lihat lagi >',
    },
    '435qcey3': {
      'ko': '실시간 랭킹! 인기 상품 TOP!',
      'bn': 'সেরা বিক্রিত প্রিয়!',
      'en': 'Top-Selling Favorites!',
      'id': 'Favorit terlaris!',
    },
    'ux8hg7ee': {
      'ko': '더보기 >',
      'bn': 'আরও দেখুন >',
      'en': 'See more >',
      'id': 'Lihat lagi >',
    },
    'e1uij07e': {
      'ko': 'Hallie',
      'bn': 'Hallie',
      'en': 'Hallie',
      'id': 'Hallie',
    },
    'hykzufk4': {
      'ko': '할리 ㅣ 대표 김남기',
      'bn': '할리 | Namki Kim',
      'en': '할리 | Namki Kim',
      'id': '할리 | Namki Kim',
    },
    '2qbdqz3o': {
      'ko': '사업자등록번호 776-34-01509',
      'bn': 'Business number 776-34-01509',
      'en': 'Business number 776-34-01509',
      'id': 'Business number 776-34-01509',
    },
    'i89ijsq4': {
      'ko': '통신판매업신고번호 2025-충남서산-0276',
      'bn': 'Mail order sales approval number 2025-충남서산-0276',
      'en': 'Mail order sales approval number 2025-충남서산-0276',
      'id': 'Mail order sales approval number 2025-충남서산-0276',
    },
    'zusgkh2z': {
      'ko': '전화 : 010-9037-1943',
      'bn': 'Phone : 010-9037-1943',
      'en': 'Phone : 010-9037-1943',
      'id': 'Phone : 010-9037-1943',
    },
    '5i6kwx8j': {
      'ko': '이메일 : hallie7530@gmail.com',
      'bn': 'Email : hallie7530@gmail.com',
      'en': 'Email : hallie7530@gmail.com',
      'id': 'Email : hallie7530@gmail.com',
    },
    'ipqka7jq': {
      'ko': '주소 : 충남 서산시 대곡2길 15-10',
      'bn': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
      'en': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
      'id': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
    },
    'qhjbjypn': {
      'ko': 'ㅣ',
      'bn': 'l',
      'en': 'ㅣ',
      'id': 'l',
    },
    's0z36shw': {
      'ko': '개인정보 처리방침',
      'bn': 'গোপনীয়তা নীতি',
      'en': 'privacy policy',
      'id': 'Kebijakan Privasi',
    },
    'l08mxz2u': {
      'ko': 'ㅣ',
      'bn': 'l',
      'en': 'ㅣ',
      'id': 'l',
    },
    'wf28wq1z': {
      'ko': '서비스 이용약관',
      'bn': 'পরিষেবার শর্তাবলী',
      'en': 'Terms of Service',
      'id': 'Ketentuan Layanan',
    },
    'vmjmii7i': {
      'ko': 'ㅣ',
      'bn': 'l',
      'en': 'ㅣ',
      'id': 'l',
    },
    '5a736ppg': {
      'ko': 'ㅣ',
      'bn': 'l',
      'en': 'ㅣ',
      'id': 'l',
    },
    'qx8cly5v': {
      'ko': '배송, 교환, 환불 정책',
      'bn': 'শিপিং, এক্সচেঞ্জ ও ফেরতের নীতি',
      'en': 'Shipping, Exchange, and Refund Policy',
      'id': 'Kebijakan Pengiriman & Pengembalian',
    },
    '8sapuvz8': {
      'ko': 'ㅣ',
      'bn': 'l',
      'en': 'ㅣ',
      'id': 'l',
    },
    'rp2duxqg': {
      'ko':
          '사이버몰 내 판매되는 상품 중에는 할리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. 마켓플레이스(오픈마켓) 상품의 경우 할리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 해당 상품의 거래 전반에 관한 의무와 책임은 각 입점 판매자에게 있습니다.',
      'bn':
          'সাইবারমলের মধ্যে বিক্রি হওয়া কিছু পণ্যের মধ্যে রয়েছে হার্লির সাথে সম্পর্কিত পৃথক বিক্রেতাদের দ্বারা বিক্রি করা মার্কেটপ্লেস (খোলা বাজার) পণ্য। মার্কেটপ্লেস (খোলা বাজার) পণ্যের জন্য, হার্লি একটি মেইল-অর্ডার মধ্যস্থতাকারী হিসেবে কাজ করে এবং অনলাইন বিক্রয় লেনদেনের কোনও পক্ষ নয়। প্রতিটি অংশগ্রহণকারী বিক্রেতা লেনদেনের সাথে সম্পর্কিত সমস্ত বাধ্যবাধকতা এবং দায়িত্বের জন্য দায়ী।',
      'en':
          'Some products sold within the cybermall include marketplace (open market) products sold by individual sellers affiliated with Harley. For marketplace (open market) products, Harley acts as a mail-order intermediary and is not a party to the online sales transaction. Each participating seller is responsible for all obligations and responsibilities related to the transaction.',
      'id':
          'Beberapa produk yang dijual di dalam cybermall mencakup produk marketplace (pasar terbuka) yang dijual oleh penjual individu yang berafiliasi dengan Harley. Untuk produk marketplace (pasar terbuka), Harley bertindak sebagai perantara pesanan melalui pos dan bukan pihak dalam transaksi penjualan online. Setiap penjual yang berpartisipasi bertanggung jawab atas semua kewajiban dan tanggung jawab yang terkait dengan transaksi tersebut.',
    },
    'rqhv61rw': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'brnhvtzf': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'ln2c7m05': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    'hc9cjhwr': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    '588levh1': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    'tmwno22x': {
      'ko': 'Google Play',
      'bn': 'গুগল প্লে',
      'en': 'Google Play',
      'id': 'Google Play',
    },
    'i3quye9q': {
      'ko': '앱 다운로드 하기',
      'bn': 'অ্যাপটি ডাউনলোড করুন',
      'en': 'Download the app',
      'id': 'Unduh aplikasinya',
    },
    'kobgfus3': {
      'ko': 'App Store',
      'bn': 'অ্যাপ স্টোর',
      'en': 'App Store',
      'id': 'App Store',
    },
    'g4jh29e7': {
      'ko': '앱 다운로드 하기',
      'bn': 'অ্যাপটি ডাউনলোড করুন',
      'en': 'Download the app',
      'id': 'Unduh aplikasinya',
    },
    'iex8dg41': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
  },
  // ProductDetail
  {
    'wcwc14bn': {
      'ko': '한진택배',
      'bn': '한진택배',
      'en': '한진택배',
      'id': '한진택배',
    },
    'ze0c57fj': {
      'ko': '배송비 4,000원\n30,000원 이상 구매 시 무료배송',
      'bn': 'শিপিং ফি: ৪,০০০ ওন\n৩০,০০০ ওনের বেশি অর্ডারে বিনামূল্যে শিপিং',
      'en': 'Delivery fee : 4,000 won\nFree shipping on orders over 30,000 won',
      'id':
          'Biaya pengiriman: 4.000 won\nGratis ongkos kirim untuk pesanan di atas 30.000 won',
    },
    'svsangdm': {
      'ko': 'Hallie가 직접 할랄 인증을 확인한 제품입니다.',
      'bn': 'এই পণ্যটির হালাল সার্টিফিকেশন Hallie দ্বারা যাচাই করা হয়েছে।',
      'en': 'This product has been halal-certified and verified by Hallie.',
      'id': 'Produk ini telah diverifikasi sertifikasi halalnya oleh Hallie.',
    },
    'iy0irg5s': {
      'ko': '할랄 인증 정보',
      'bn': 'হালাল সার্টিফিকেশন তথ্য',
      'en': 'Halal Certification Info',
      'id': 'Info Sertifikasi Halal',
    },
    'k3mdi0wg': {
      'ko': '자세히 보기 >',
      'bn': 'আরও জানুন >',
      'en': 'View Details >',
      'id': 'Lihat Detail >',
    },
    'yqj18hb4': {
      'ko': '인증 기관',
      'bn': 'প্রত্যয়ন সংস্থা',
      'en': 'Certifier',
      'id': 'Lembaga',
    },
    '8eri5am6': {
      'ko': '인증 번호',
      'bn': 'সার্টিফিকেট নং',
      'en': 'Cert No.',
      'id': 'No. Sertifikat',
    },
    '19ruywyx': {
      'ko': '발급일',
      'bn': 'ইস্যু',
      'en': 'Issued',
      'id': 'Terbit',
    },
    'qll1qc5a': {
      'ko': '만료일',
      'bn': 'মেয়াদ শেষ',
      'en': 'Expires',
      'id': 'Berlaku s/d',
    },
    'x8jlyf3g': {
      'ko': '상품 정보',
      'bn': 'পণ্যের তথ্য',
      'en': 'Product Information',
      'id': 'Informasi Produk',
    },
    '0uusczch': {
      'ko': '필수표기정보 보기 >',
      'bn': 'প্রয়োজনীয় তথ্য দেখুন >',
      'en': 'View required info >',
      'id': 'Lihat info wajib >',
    },
    'xxm31sw7': {
      'ko': '>',
      'bn': '>',
      'en': '>',
      'id': '>',
    },
    'w9wl972e': {
      'ko': '원산지',
      'bn': 'উৎপত্তি',
      'en': 'origin',
      'id': 'asal',
    },
    'hp9sdfd0': {
      'ko': ':',
      'bn': ':',
      'en': ':',
      'id': ':',
    },
    'j9iznacm': {
      'ko': '상품 설명',
      'bn': 'পণ্যের বর্ণনা',
      'en': 'Product Description',
      'id': 'Deskripsi Produk',
    },
    'p5npb59m': {
      'ko': '리뷰',
      'bn': 'পর্যালোচনা',
      'en': 'review',
      'id': 'tinjauan',
    },
    '80wiwjxa': {
      'ko': '더보기 >',
      'bn': 'আরও দেখুন >',
      'en': 'See More >',
      'id': 'Lihat Lagi >',
    },
    'eti471pq': {
      'ko': '판매자 정보',
      'bn': 'বিক্রেতার তথ্য',
      'en': 'Seller Information',
      'id': 'Informasi Penjual',
    },
    '39vgbofp': {
      'ko': '상호명 : ',
      'bn': 'কোম্পানির নাম : ',
      'en': 'Company name : ',
      'id': 'Nama perusahaan : ',
    },
    'c8zvzypi': {
      'ko': '대표 : ',
      'bn': 'প্রতিনিধি : ',
      'en': 'representative : ',
      'id': 'perwakilan : ',
    },
    'sszfeopk': {
      'ko': '사업자등록번호 : ',
      'bn': 'ব্যবসা নিবন্ধন নম্বর : ',
      'en': 'Business number : ',
      'id': 'Nomor Registrasi Usaha : ',
    },
    'nwq573sp': {
      'ko': '통신판매업신고번호 : ',
      'bn': 'ই-কমার্স লাইসেন্স নং : ',
      'en': 'Mail order sales approval number : ',
      'id': 'No. Persetujuan Mail Order : ',
    },
    'wstvdsyc': {
      'ko': '전화 : ',
      'bn': 'ফোন কল : ',
      'en': 'phone : ',
      'id': 'panggilan telepon : ',
    },
    '4d3ml1iv': {
      'ko': '이메일 : ',
      'bn': 'ইমেইল : ',
      'en': 'email : ',
      'id': 'Email : ',
    },
    'zh5t3cn6': {
      'ko': '주소 : ',
      'bn': 'ঠিকানা : ',
      'en': 'address : ',
      'id': 'alamat : ',
    },
    '9vkdu1yj': {
      'ko': '교환 및 환불 안내',
      'bn': 'বিনিময় এবং ফেরতের তথ্য',
      'en': 'Exchange and Refund Information',
      'id': 'Informasi Penukaran dan Pengembalian Dana',
    },
    'n1870wrx': {
      'ko': '교환/반품 안내',
      'bn': 'বিনিময়/প্রত্যাবর্তনের তথ্য',
      'en': 'Exchange/Return Information',
      'id': 'Informasi Penukaran/Pengembalian',
    },
    'o7rg55ce': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'sbjbji4f': {
      'ko':
          '상품이 표시·광고 내용과 다르거나, 오배송, 파손, 불량, 유통기한 문제 등 결함이 있는 경우, 상품 수령일로부터 3개월 이내 교환 또는 환불을 요청하실 수 있습니다.',
      'bn':
          'যদি পণ্যটি বিজ্ঞাপন বা প্রদর্শিত পণ্যের থেকে ভিন্ন হয়, অথবা ত্রুটিপূর্ণ হয় (যেমন, ভুলভাবে সরবরাহ করা হয়েছে, ক্ষতিগ্রস্ত হয়েছে, ত্রুটিপূর্ণ হয়েছে, অথবা মেয়াদ শেষ হওয়ার তারিখের সমস্যা আছে), তাহলে আপনি পণ্যটি প্রাপ্তির তারিখ থেকে 3 মাসের মধ্যে বিনিময় বা ফেরতের অনুরোধ করতে পারেন।',
      'en':
          'If the product is different from what was advertised or displayed, or is defective (e.g., incorrectly delivered, damaged, defective, or has an expiration date issue), you may request an exchange or refund within 3 months from the date of receipt of the product.',
      'id':
          'Jika produk berbeda dari yang diiklankan atau ditampilkan, atau cacat, misalnya karena pengiriman yang salah, kerusakan, cacat, atau tanggal kedaluwarsa, Anda dapat meminta penukaran atau pengembalian dana dalam waktu 3 bulan sejak tanggal penerimaan produk.',
    },
    'g3p3ri7o': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '7t7no4pk': {
      'ko': '상품 불량 또는 하자 확인을 위해 문제를 확인할 수 있는 사진 촬영 후 고객센터로 문의해 주시기 바랍니다.',
      'bn':
          'পণ্যটি ত্রুটিপূর্ণ বা ক্ষতিগ্রস্ত কিনা তা নিশ্চিত করতে, অনুগ্রহ করে এমন ছবি তুলুন যা সমস্যাটি নিশ্চিত করতে পারে এবং গ্রাহক পরিষেবা কেন্দ্রে যোগাযোগ করুন।',
      'en':
          'To confirm whether the product is defective or damaged, please take photos that can confirm the problem and contact the customer service center.',
      'id':
          'Untuk memastikan apakah produk tersebut cacat atau rusak, harap ambil foto yang dapat membuktikan masalah tersebut dan hubungi pusat layanan pelanggan.',
    },
    '1kcm3vxo': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'rwe1lm5s': {
      'ko': '수령 즉시 확인 가능한 문제(누락, 파손, 냉해 등)는 상품 수령일로부터 7일 이내 문의 시 처리가 가능합니다.',
      'bn':
          'পণ্যটি প্রাপ্তির ৭ দিনের মধ্যে আমাদের সাথে যোগাযোগ করলে, প্রাপ্তির সাথে সাথেই নিশ্চিত হতে পারে এমন যেকোনো সমস্যা (নিখোঁজ জিনিসপত্র, ক্ষতি, ঠান্ডাজনিত ক্ষতি ইত্যাদি) সমাধান করা যেতে পারে।',
      'en':
          'Any issues that can be confirmed immediately upon receipt (missing items, damage, cold damage, etc.) can be addressed if you contact us within 7 days of receiving the product.',
      'id':
          'Segala masalah yang dapat dikonfirmasi segera setelah diterima (barang hilang, kerusakan, kerusakan akibat suhu dingin, dll.) dapat ditangani jika Anda menghubungi kami dalam waktu 7 hari setelah menerima produk.',
    },
    'f9x85xql': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '3zffnccu': {
      'ko':
          '결함이 없는 상품의 경우에도, 미개봉 및 미사용 상태의 새 제품에 한해 상품 수령일로부터 7일 이내 교환 또는 반품 신청이 가능합니다.',
      'bn':
          'এমনকি ত্রুটিবিহীন পণ্যের ক্ষেত্রেও, প্রাপ্তির তারিখ থেকে ৭ দিনের মধ্যে বিনিময় বা ফেরত দেওয়া সম্ভব, যদি পণ্যটি নতুন, খোলা না থাকে এবং অব্যবহৃত থাকে।',
      'en':
          'Even for products without defects, exchanges or returns are possible within 7 days from the date of receipt, provided the product is new, unopened, and unused.',
      'id':
          'Bahkan untuk produk tanpa cacat, penukaran atau pengembalian dimungkinkan dalam waktu 7 hari sejak tanggal penerimaan, dengan syarat produk tersebut masih baru, belum dibuka, dan belum digunakan.',
    },
    '1uy7c8jq': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '2tmijm8d': {
      'ko': '기타 상품 결함에 대한 보상은 소비자분쟁해결기준(공정거래위원회 고시)에 따라 처리됩니다.',
      'bn':
          'অন্যান্য পণ্যের ত্রুটির জন্য ক্ষতিপূরণ গ্রাহক বিরোধ নিষ্পত্তি মানদণ্ড (ফেয়ার ট্রেড কমিশন নোটিশ) অনুসারে প্রক্রিয়া করা হবে।',
      'en':
          'Compensation for other product defects will be processed in accordance with the Consumer Dispute Resolution Standards (Fair Trade Commission Notice).',
      'id':
          'Ganti rugi atas cacat produk lainnya akan ditangani sesuai dengan Standar Penyelesaian Sengketa Konsumen (Pemberitahuan Komisi Perdagangan Adil).',
    },
    '16u6iz87': {
      'ko': '교환/반품 불가 안내',
      'bn': 'অ-বিনিময়যোগ্য/অ-ফেরতযোগ্য পণ্য সম্পর্কিত তথ্য',
      'en': 'Information on non-exchangeable/non-returnable items',
      'id': 'Informasi mengenai barang yang tidak dapat ditukar/dikembalikan',
    },
    '0hip6v47': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '73qxewun': {
      'ko': '신선/냉장/냉동식품은 단순 변심, 주문 착오 등 고객 사유에 의한 교환 및 반품이 제한될 수 있습니다.',
      'bn':
          'গ্রাহকের সাধারণ মন পরিবর্তন বা অর্ডার করার সময় ত্রুটির মতো কারণে তাজা/ফ্রিজ/হিমায়িত খাবারের বিনিময় এবং ফেরত সীমাবদ্ধ করা হতে পারে।',
      'en':
          'Exchanges and returns of fresh/refrigerated/frozen foods may be restricted due to customer reasons such as simple change of mind or ordering error.',
      'id':
          'Penukaran dan pengembalian makanan segar/dingin/beku mungkin dibatasi karena alasan pelanggan seperti perubahan pikiran atau kesalahan pemesanan.',
    },
    'gsi1lnrm': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '24wijc5e': {
      'ko': '고객의 보관 부주의 또는 잘못된 보관 방법으로 인한 오염, 파손, 변질된 경우 교환 및 반품이 불가합니다.',
      'bn':
          'গ্রাহকের অবহেলা বা ভুল সংরক্ষণ পদ্ধতির কারণে পণ্যটি দূষিত, ক্ষতিগ্রস্ত বা খারাপ হয়ে গেলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'Exchanges and returns are not possible if the product is contaminated, damaged, or deteriorated due to the customer\'s negligence or incorrect storage methods.',
      'id':
          'Penukaran dan pengembalian tidak dimungkinkan jika produk terkontaminasi, rusak, atau mengalami penurunan kualitas akibat kelalaian pelanggan atau metode penyimpanan yang salah.',
    },
    'sxq3kz8e': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'fmnwfgst': {
      'ko': '고객의 사용 또는 일부 소비로 상품의 가치가 훼손된 경우 교환 및 반품이 불가합니다.',
      'bn':
          'গ্রাহকের ব্যবহারের কারণে বা আংশিক ব্যবহারের কারণে পণ্যের মূল্য ক্ষতিগ্রস্ত হলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'Exchanges and returns are not possible if the value of the product has been damaged due to the customer\'s use or partial consumption.',
      'id':
          'Penukaran dan pengembalian tidak dimungkinkan jika nilai produk telah rusak karena penggunaan atau konsumsi sebagian oleh pelanggan.',
    },
    'e7x59gtn': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'xu8rkbrq': {
      'ko':
          '상품 포장을 개봉하여 사용 또는 설치가 완료되어 재판매가 불가능한 경우 교환 및 반품이 불가합니다.\n(단, 내용 확인을 위한 포장 개봉은 예외로 합니다.)',
      'bn':
          'যদি পণ্যের প্যাকেজিং খোলা, ব্যবহার করা বা ইনস্টল করা হয়ে থাকে এবং পুনরায় বিক্রি করা না যায়, তাহলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়। (তবে, বিষয়বস্তু পরীক্ষা করার জন্য প্যাকেজিং খোলা একটি ব্যতিক্রম।)',
      'en':
          'If the product packaging has been opened, used, or installed, and cannot be resold, exchanges and returns are not possible. (However, opening the packaging to check the contents is an exception.)',
      'id':
          'Jika kemasan produk telah dibuka, digunakan, atau dipasang, dan tidak dapat dijual kembali, penukaran dan pengembalian tidak dimungkinkan. (Namun, membuka kemasan untuk memeriksa isinya merupakan pengecualian.)',
    },
    'te35nvgq': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'kipvsf76': {
      'ko': '시간 경과에 따라 상품의 가치가 현저히 감소하여 재판매가 불가능한 경우 교환 및 반품이 불가합니다.',
      'bn':
          'যদি সময়ের সাথে সাথে পণ্যের মূল্য উল্লেখযোগ্যভাবে হ্রাস পায় এবং পণ্যটি পুনরায় বিক্রি করা না যায়, তাহলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'If the value of the product has significantly decreased over time and the product cannot be resold, exchanges and returns are not possible.',
      'id':
          'Jika nilai produk telah menurun secara signifikan seiring waktu dan produk tersebut tidak dapat dijual kembali, maka penukaran dan pengembalian tidak dimungkinkan.',
    },
    'ycrhwyo6': {
      'ko': '교환/반품 처리 안내',
      'bn': 'বিনিময়/প্রত্যাবর্তন প্রক্রিয়াকরণ নির্দেশিকা',
      'en': 'Exchange/Return Processing Guide',
      'id': 'Panduan Pemrosesan Penukaran/Pengembalian',
    },
    'zhv4q0z7': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'cqwltkon': {
      'ko': '상품의 하자 또는 오배송 등 결함이 확인된 경우 반품 배송비는 판매자가 부담합니다.',
      'bn':
          'যদি কোনও ত্রুটি নিশ্চিত হয়, যেমন একটি ত্রুটিপূর্ণ পণ্য বা ভুল ডেলিভারি, তাহলে বিক্রেতা ফেরত পাঠানোর খরচের জন্য দায়ী থাকবে।',
      'en':
          'If a defect is confirmed, such as a defective product or incorrect delivery, the seller will be responsible for the return shipping costs.',
      'id':
          'Jika kerusakan terkonfirmasi, seperti produk cacat atau pengiriman yang salah, penjual akan bertanggung jawab atas biaya pengiriman pengembalian.',
    },
    'iuhu50lm': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'laqd9vvh': {
      'ko': '단순 변심에 의한 반품의 경우 재입고 수수료 6,000원이 부과될 수 있으며, 반품 배송비는 고객 부담입니다.',
      'bn':
          'যদি মন পরিবর্তনের কারণে ফেরত দেওয়া হয়, তাহলে ৬,০০০ ওন রিস্টকিং ফি নেওয়া যেতে পারে এবং ফেরত পাঠানোর খরচের জন্য গ্রাহক দায়ী থাকবেন।',
      'en':
          'In case of returns due to simple change of mind, a restocking fee of 6,000 won may be charged, and the customer is responsible for return shipping costs.',
      'id':
          'Dalam hal pengembalian karena perubahan pikiran semata, biaya pengembalian stok sebesar 6.000 won dapat dikenakan, dan pelanggan bertanggung jawab atas biaya pengiriman pengembalian.',
    },
    'mwhwohjk': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'nwucg0kg': {
      'ko': '교환 및 반품은 고객센터 안내에 따라 사전 접수 후 개별적으로 진행됩니다.',
      'bn':
          'গ্রাহক কেন্দ্রের নির্দেশ অনুসারে পূর্ব আবেদনের পর বিনিময় এবং রিটার্ন পৃথকভাবে প্রক্রিয়া করা হয়।',
      'en':
          'Exchanges and returns are processed individually after prior application according to the customer center\'s instructions.',
      'id':
          'Penukaran dan pengembalian diproses secara individual setelah permohonan sebelumnya sesuai dengan petunjuk pusat layanan pelanggan.',
    },
    '4tw6o5ne': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'fsqvbnkq': {
      'ko': '사전 접수 없이 임의로 반품하신 경우 교환 또는 환불 처리가 제한될 수 있습니다.',
      'bn':
          'যদি আপনি পূর্ব নোটিশ ছাড়াই কোনও জিনিস ফেরত দেন, তাহলে আপনার বিনিময় বা ফেরত দেওয়ার ক্ষমতা সীমিত হতে পারে।',
      'en':
          'If you return an item without prior notice, your ability to exchange or refund may be restricted.',
      'id':
          'Jika Anda mengembalikan barang tanpa pemberitahuan sebelumnya, kemampuan Anda untuk menukar atau meminta pengembalian dana mungkin akan dibatasi.',
    },
    'zkyfrteg': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '4i9b933b': {
      'ko': '반품 주소 :',
      'bn': 'ফেরত ঠিকানা : ',
      'en': 'Return Address : ',
      'id': 'Alamat Retur',
    },
    'ij29x51a': {
      'ko': '인천 서구 원창동 394-35',
      'bn': '인천 서구 원창동 394-35',
      'en': '인천 서구 원창동 394-35',
      'id': '인천 서구 원창동 394-35',
    },
    'qljgvkq2': {
      'ko': '주문 취소 안내',
      'bn': 'অর্ডার বাতিলের বিজ্ঞপ্তি',
      'en': 'Order Cancellation Notice',
      'id': 'Pemberitahuan Pembatalan Pesanan',
    },
    '9xbgl6wr': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '5ifp7nzy': {
      'ko': '주문취소는 [주문 목록>주문내역]에서 직접 하실 수 있습니다.',
      'bn':
          'আপনি সরাসরি [অর্ডার তালিকা > অর্ডারের বিবরণ] থেকে আপনার অর্ডার বাতিল করতে পারেন।',
      'en':
          'You can cancel your order directly from [Order List > Order Details].',
      'id':
          'Anda dapat membatalkan pesanan Anda langsung dari [Daftar Pesanan > Detail Pesanan].',
    },
    '90fufrp7': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'ox52ym0e': {
      'ko':
          '주문 상태가 [배송중]인 경우 배송이 시작되어 주문 취소가 불가하며, 반품 접수를 통해 처리해야 합니다.\n(단, 상품에 따라 반품이 제한될 수 있습니다.)',
      'bn':
          'যদি আপনার অর্ডারের অবস্থা [ডেলিভারিতে] হয়, তাহলে শিপিং শুরু হয়ে গেছে এবং বাতিল করা সম্ভব নয়। আপনার অর্ডার প্রক্রিয়া করার জন্য আপনাকে একটি ফেরতের অনুরোধ জমা দিতে হবে। (তবে, পণ্যের উপর নির্ভর করে ফেরতের পরিমাণ সীমিত হতে পারে।)',
      'en':
          'If your order status is [In Transit], shipping has begun and cancellation is not possible. You must submit a return request to process your order. (However, returns may be restricted depending on the product.)',
      'id':
          'Jika status pesanan Anda [Dalam Pengiriman], pengiriman telah dimulai dan pembatalan tidak dimungkinkan. Anda harus mengirimkan permintaan pengembalian untuk memproses pesanan Anda. (Namun, pengembalian mungkin dibatasi tergantung pada produknya.)',
    },
    'gbrvri0i': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'fpc3ozok': {
      'ko': '주문 취소 및 반품 접수와 관련하여 도움이 필요하신 경우 고객센터로 문의해 주시기 바랍니다.',
      'bn':
          'অর্ডার বাতিল বা ফেরত দেওয়ার ক্ষেত্রে যদি আপনার সহায়তার প্রয়োজন হয়, তাহলে অনুগ্রহ করে আমাদের গ্রাহক পরিষেবা কেন্দ্রে যোগাযোগ করুন।',
      'en':
          'If you need assistance with order cancellation or return, please contact our customer service center.',
      'id':
          'Jika Anda memerlukan bantuan terkait pembatalan pesanan atau pengembalian, silakan hubungi pusat layanan pelanggan kami.',
    },
    'ccko9k54': {
      'ko': '결제 승인 취소/환불 안내',
      'bn': 'পেমেন্ট বাতিল/রিফান্ড তথ্য',
      'en': 'Payment Cancellation/Refund Information',
      'id': 'Informasi Pembatalan Pembayaran/Pengembalian Dana',
    },
    'gpkm22pc': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'gaqp3f7o': {
      'ko': '결제 승인 취소 시 결제 금액 기준으로 환불이 진행되며, 영업일 기준 약 3일 이내 결제사에 반영됩니다.',
      'bn':
          'যখন পেমেন্ট অনুমোদন বাতিল করা হয়, তখন পেমেন্টের পরিমাণের উপর ভিত্তি করে একটি রিফান্ড প্রক্রিয়া করা হবে এবং রিফান্ড প্রায় 3 কার্যদিবসের মধ্যে পেমেন্ট কোম্পানিতে প্রতিফলিত হবে।',
      'en':
          'When payment authorization is cancelled, a refund will be processed based on the payment amount, and the refund will be reflected in the payment company within approximately 3 business days.',
      'id':
          'Ketika otorisasi pembayaran dibatalkan, pengembalian dana akan diproses berdasarkan jumlah pembayaran, dan pengembalian dana akan tercermin di perusahaan pembayaran dalam waktu sekitar 3 hari kerja.',
    },
    'td12ngle': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '1jqk0ptf': {
      'ko': '사용하신 적립금 및 쿠폰의 복원 여부는 각 혜택의 적용 조건에 따라 상이할 수 있습니다.',
      'bn':
          'আপনার ব্যবহৃত পয়েন্ট এবং কুপন পুনরুদ্ধার করতে পারবেন কিনা তা প্রতিটি সুবিধার আবেদনের শর্তের উপর নির্ভর করে পরিবর্তিত হতে পারে।',
      'en':
          'Whether or not you can restore your used points and coupons may vary depending on the application conditions of each benefit.',
      'id':
          'Apakah Anda dapat mengembalikan poin dan kupon yang telah digunakan atau tidak, mungkin berbeda-beda tergantung pada ketentuan penggunaan masing-masing manfaat.',
    },
    'giwn9dyn': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'orydyl5k': {
      'ko':
          '환불 처리 시점은 결제 수단 및 결제 대행사의 정책에 따라 달라질 수 있으며, 자세한 사항은 해당 결제사에 문의해 주시기 바랍니다.',
      'bn':
          'আপনার পেমেন্ট পদ্ধতি এবং পেমেন্ট প্রসেসরের নীতির উপর নির্ভর করে রিফান্ড প্রক্রিয়াকরণের সময় পরিবর্তিত হতে পারে। বিস্তারিত জানার জন্য অনুগ্রহ করে আপনার পেমেন্ট প্রসেসরের সাথে যোগাযোগ করুন।',
      'en':
          'Refund processing times may vary depending on your payment method and the payment processor\'s policies. Please contact your payment processor for details.',
      'id':
          'Waktu pemrosesan pengembalian dana dapat bervariasi tergantung pada metode pembayaran Anda dan kebijakan penyedia layanan pembayaran. Silakan hubungi penyedia layanan pembayaran Anda untuk detailnya.',
    },
    'k0x33vth': {
      'ko':
          '사이버몰 내 판매되는 상품 중에는 할리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. 마켓플레이스(오픈마켓) 상품의 경우 할리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 해당 상품의 거래 전반에 관한 의무와 책임은 각 입점 판매자에게 있습니다.',
      'bn':
          'সাইবারমলের মধ্যে বিক্রি হওয়া কিছু পণ্যের মধ্যে রয়েছে হার্লির সাথে সম্পর্কিত পৃথক বিক্রেতাদের দ্বারা বিক্রি করা মার্কেটপ্লেস (খোলা বাজার) পণ্য। মার্কেটপ্লেস (খোলা বাজার) পণ্যের জন্য, হার্লি একটি মেইল-অর্ডার মধ্যস্থতাকারী হিসেবে কাজ করে এবং অনলাইন বিক্রয় লেনদেনের কোনও পক্ষ নয়। প্রতিটি অংশগ্রহণকারী বিক্রেতা লেনদেনের সাথে সম্পর্কিত সমস্ত বাধ্যবাধকতা এবং দায়িত্বের জন্য দায়ী।',
      'en':
          'Some products sold within the cybermall include marketplace (open market) products sold by individual sellers affiliated with Harley. For marketplace (open market) products, Harley acts as a mail-order intermediary and is not a party to the online sales transaction. Each participating seller is responsible for all obligations and responsibilities related to the transaction.',
      'id':
          'Beberapa produk yang dijual di dalam cybermall mencakup produk pasar terbuka (marketplace) yang dijual oleh penjual individu yang berafiliasi dengan Harley. Untuk produk pasar terbuka, Harley bertindak sebagai perantara pesanan melalui pos dan bukan pihak dalam transaksi penjualan online. Setiap penjual yang berpartisipasi bertanggung jawab atas semua kewajiban dan tanggung jawab yang terkait dengan transaksi tersebut.',
    },
    'uqi1cl7b': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Cart
  {
    '1ndiaqpp': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Cart',
      'id': 'Keranjang Belanja',
    },
    'v43pp70s': {
      'ko': '상품 금액',
      'bn': 'পণ্যের দাম',
      'en': 'product price',
      'id': 'Harga produk',
    },
    '9cjo5ifi': {
      'ko': '배송비',
      'bn': 'ডেলিভারি ফি',
      'en': 'delivery fee',
      'id': 'biaya pengiriman',
    },
    'duoe8vtw': {
      'ko': '결제 예정 금액',
      'bn': 'পরিশোধের পরিমাণ',
      'en': 'Total Payment',
      'id': 'Jumlah Perlu dibayar',
    },
    'nn2n2bn4': {
      'ko': '장바구니가 비어있어요',
      'bn': 'তোমার শপিং কার্ট খালি।',
      'en': 'Your cart is empty',
      'id': 'Keranjang belanja Anda kosong',
    },
    'f1y5zgr1': {
      'ko': '마음에 드는 상품을 담아보세요!',
      'bn': 'আপনার পছন্দের পণ্য যোগ করুন!',
      'en': 'Add the products you like!',
      'id': 'Tambahkan produk yang Anda sukai!',
    },
    'dj7cokrr': {
      'ko': '상품 목록으로 이동 >',
      'bn': 'পণ্য তালিকাতে যান >',
      'en': 'Go to product list >',
      'id': 'Buka daftar produk >',
    },
    'tl9mac22': {
      'ko': '더 담으면 무료배송!',
      'bn': 'ফ্রি ডেলিভারির জন্য আরও যোগ করুন!',
      'en': 'Add more to get free shipping!',
      'id': 'Tambah lagi untuk gratis ongkir!',
    },
    '3ookuelm': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '2vd7e9qc': {
      'ko': '주문하기',
      'bn': 'অর্ডার',
      'en': 'Order',
      'id': 'Memesan',
    },
    '0s0z9o3j': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'yr3yo2kg': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'wc2byrc3': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    '9wig27le': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    'r4uz3m8k': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Cart',
      'id': 'Keranjang Belanja',
    },
    'txx1xp4s': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Cart',
      'id': 'Keranjang Belanja',
    },
  },
  // Checkout
  {
    'tsinww59': {
      'ko': '주문',
      'bn': 'অর্ডার',
      'en': 'order',
      'id': 'memesan',
    },
    'gj4kqxmi': {
      'ko': '주문 상품',
      'bn': 'অর্ডার করা পণ্য',
      'en': 'Ordered products',
      'id': 'Produk yang dipesan',
    },
    'wzl4l5ju': {
      'ko': '배송지 정보',
      'bn': 'ডেলিভারি তথ্য',
      'en': 'Delivery information',
      'id': 'Informasi pengiriman',
    },
    '4cf8zd7o': {
      'ko': '변경하기',
      'bn': 'পরিবর্তন',
      'en': 'Change',
      'id': 'Ubah',
    },
    '5a729gbl': {
      'ko': '기본 배송지',
      'bn': 'ডিফল্ট ঠিকানা',
      'en': 'Default Address',
      'id': 'Alamat Default',
    },
    'hyoknudx': {
      'ko': '배송 요청사항을 선택해주세요',
      'bn': 'আপনার শিপিং অনুরোধ নির্বাচন করুন',
      'en': 'Please select your shipping request',
      'id': 'Silakan pilih permintaan pengiriman Anda.',
    },
    'p7gzqeh7': {
      'ko': 'Search...',
      'bn': 'অনুসন্ধান...',
      'en': 'Search...',
      'id': 'Mencari...',
    },
    'u8k917hn': {
      'ko': '요청사항 없음',
      'bn': 'কোনও অনুরোধ নেই',
      'en': 'No requests',
      'id': 'Tidak ada permintaan',
    },
    'aonv9vxt': {
      'ko': '문 앞에 놓아주세요',
      'bn': 'দয়া করে দরজার সামনে রেখে দিন।',
      'en': 'Please leave it in front of the door',
      'id': 'Silakan letakkan di depan pintu.',
    },
    'fri2e4vi': {
      'ko': '경비실에 맡겨주세요',
      'bn': 'দয়া করে এটি নিরাপত্তা অফিসে রেখে যান।',
      'en': 'Please leave it at the security office.',
      'id': 'Silakan tinggalkan di kantor keamanan.',
    },
    'hgpr5yrd': {
      'ko': '배송 전에 연락주세요',
      'bn': 'শিপিংয়ের আগে আমাদের সাথে যোগাযোগ করুন',
      'en': 'Please contact us before shipping',
      'id': 'Silakan hubungi kami sebelum pengiriman.',
    },
    'hk99vx53': {
      'ko': '직접 입력',
      'bn': 'সরাসরি ইনপুট',
      'en': 'Direct input',
      'id': 'Masukan langsung',
    },
    'yg0qbayn': {
      'ko': '배송 요청사항을 입력해주세요',
      'bn': 'আপনার শিপিং অনুরোধটি লিখুন।',
      'en': 'Please enter your shipping request',
      'id': 'Silakan masukkan permintaan pengiriman Anda.',
    },
    'aje90f8x': {
      'ko': '쿠폰/포인트 할인',
      'bn': 'কুপন/পয়েন্ট ছাড়',
      'en': 'Coupon/Point Discount',
      'id': 'Diskon Kupon/Poin',
    },
    'fqksguwt': {
      'ko': '쿠폰',
      'bn': 'কুপন',
      'en': 'coupon',
      'id': 'kupon',
    },
    'oh6uq7sw': {
      'ko': '사용 가능',
      'bn': 'উপলব্ধ',
      'en': 'Available',
      'id': 'Tersedia',
    },
    'mbe0490e': {
      'ko': ' 할인',
      'bn': 'ছাড়',
      'en': 'discount',
      'id': 'diskon',
    },
    '6ozj4j51': {
      'ko': ' 만료',
      'bn': 'মেয়াদোত্তীর্ণ',
      'en': 'expiration',
      'id': 'kedaluwarsa',
    },
    '7c7k2ygv': {
      'ko': '포인트',
      'bn': 'বিন্দু',
      'en': 'point',
      'id': 'titik',
    },
    'hzkb7ilv': {
      'ko': '사용 가능',
      'bn': 'উপলব্ধ',
      'en': 'Available',
      'id': 'Tersedia',
    },
    'hhpfi8so': {
      'ko': 'P',
      'bn': 'প',
      'en': 'P',
      'id': 'P',
    },
    'rl3h622v': {
      'ko': '0',
      'bn': '0',
      'en': '0',
      'id': '0',
    },
    'pbi19908': {
      'ko': '모두 사용',
      'bn': 'সব ব্যবহার',
      'en': 'Use all',
      'id': 'Semua',
    },
    '1z9hduin': {
      'ko': '결제 금액',
      'bn': 'পেমেন্টের পরিমাণ',
      'en': 'Payment amount',
      'id': 'Jumlah pembayaran',
    },
    'jdnyn6eb': {
      'ko': '상품 금액',
      'bn': 'পণ্যের দাম',
      'en': 'Product price',
      'id': 'Harga produk',
    },
    '47v1q3jz': {
      'ko': '쿠폰 할인',
      'bn': 'কুপন ছাড়',
      'en': 'Coupon discount',
      'id': 'Diskon kupon',
    },
    '04weq3ms': {
      'ko': '포인트 할인',
      'bn': 'পয়েন্ট ছাড়',
      'en': 'Point discount',
      'id': 'Diskon poin',
    },
    'w7b68ux0': {
      'ko': '배송비',
      'bn': 'ডেলিভারি ফি',
      'en': 'delivery fee',
      'id': 'biaya pengiriman',
    },
    '1t5qi8e1': {
      'ko': '총 결제 금액',
      'bn': 'মোট পেমেন্টের পরিমাণ',
      'en': 'Total payment amount',
      'id': 'Jumlah total pembayaran',
    },
    '0ms11z3i': {
      'ko': '주문하기',
      'bn': 'অর্ডার',
      'en': 'Order',
      'id': 'Memesan',
    },
    'a9worhse': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // search
  {
    'bqqzte0x': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'rb7gu28f': {
      'ko': '검색어를 입력해주세요!',
      'bn': 'অনুসন্ধান শব্দ লিখুন!',
      'en': 'Please enter your search term!',
      'id': 'Masukkan kata kunci!',
    },
    '5v5wxeph': {
      'ko': '최근 검색어',
      'bn': 'সাম্প্রতিক অনুসন্ধানগুলি',
      'en': 'Recent searches',
      'id': 'Pencarian terbaru',
    },
    'zeefk1sf': {
      'ko': '추천 검색어',
      'bn': 'প্রস্তাবিত অনুসন্ধান পদ',
      'en': 'Recommended search terms',
      'id': 'Istilah pencarian yang disarankan',
    },
    'l747gvk2': {
      'ko': '급상승 검색어',
      'bn': 'ক্রমবর্ধমান অনুসন্ধান পদ',
      'en': 'Rising search terms',
      'id': 'Istilah pencarian yang meningkat',
    },
    '05o7q7hn': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    '2qk2y2ie': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'ry7ow7uq': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    'q6ohd9en': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    '1i3xdsr4': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    'db2ie0v8': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
  },
  // Category
  {
    '01vnocbn': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    '5nbvt8dk': {
      'ko': '검색어를 입력하세요!',
      'bn': 'অনুসন্ধান শব্দ লিখুন!',
      'en': 'Please enter your search term!',
      'id': 'Masukkan kata kunci',
    },
    'r77ap3r3': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'hcjyfe1u': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'ekiu8jdi': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    '3gosm90p': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    'y9gyexj3': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    '89fvvvp0': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
  },
  // Mypage
  {
    '3qqzvs95': {
      'ko': '마이페이지',
      'bn': 'আমার পাতা',
      'en': 'My Page',
      'id': 'Halaman Saya',
    },
    '8b4p1cnx': {
      'ko': '내 정보 관리',
      'bn': 'আমার তথ্য',
      'en': 'My Account',
      'id': 'Akun Saya',
    },
    'vkq816bt': {
      'ko': '쿠폰',
      'bn': 'কুপন',
      'en': 'coupon',
      'id': 'kupon',
    },
    'fnd3jwjo': {
      'ko': '포인트',
      'bn': 'বিন্দু',
      'en': 'point',
      'id': 'titik',
    },
    '1ksgxi9j': {
      'ko': 'P',
      'bn': 'প',
      'en': 'P',
      'id': 'P',
    },
    '22hne1x1': {
      'ko': '최근 본 상품',
      'bn': 'সাম্প্রতিক দেখা হয়েছে',
      'en': 'Recently viewed',
      'id': 'Baru Dilihat',
    },
    '0kr9vd7i': {
      'ko': '주문 내역',
      'bn': 'অর্ডারের ইতিহাস',
      'en': 'Order History',
      'id': 'Riwayat Pesanan',
    },
    '5bicmhfc': {
      'ko': '작성한 리뷰',
      'bn': 'আমার রিভিউ',
      'en': 'My Reviews',
      'id': 'Ulasan Saya',
    },
    'z7cm9r90': {
      'ko': '언어 / Language',
      'bn': '언어 / Language',
      'en': '언어 / Language',
      'id': '언어 / Language',
    },
    'ggtyekrl': {
      'ko': '서비스 이용 약관',
      'bn': 'পরিষেবার শর্তাবলী',
      'en': 'Terms of Service',
      'id': 'Ketentuan Layanan',
    },
    '91rc2m31': {
      'ko': '개인정보 처리방침',
      'bn': 'গোপনীয়তা নীতি',
      'en': 'privacy policy',
      'id': 'Kebijakan Privasi',
    },
    '67cnuiox': {
      'ko': '로그아웃',
      'bn': 'লগ আউট',
      'en': 'Log Out',
      'id': 'keluar',
    },
    'eckkahyu': {
      'ko': 'Hallie',
      'bn': 'Hallie',
      'en': 'Hallie',
      'id': 'Hallie',
    },
    '2qoaultw': {
      'ko': '할리 ㅣ 대표 김남기',
      'bn': '할리 | Namki Kim',
      'en': '할리 | Namki Kim',
      'id': '할리 | Namki Kim',
    },
    '3bwjhfyj': {
      'ko': '사업자등록번호 776-34-01509',
      'bn': 'Business number 776-34-01509',
      'en': 'Business number 776-34-01509',
      'id': 'Business number 776-34-01509',
    },
    'al7t4ec2': {
      'ko': '통신판매업신고번호 2025-충남서산-0276',
      'bn': 'Mail order sales approval number 2025-충남서산-0276',
      'en': 'Mail order sales approval number 2025-충남서산-0276',
      'id': 'Mail order sales approval number 2025-충남서산-0276',
    },
    'qc4vicdc': {
      'ko': '전화 : 010-9037-1943',
      'bn': 'Phone : 010-9037-1943',
      'en': 'Phone : 010-9037-1943',
      'id': 'Phone : 010-9037-1943',
    },
    'd2pple2u': {
      'ko': '이메일 : hallie7530@gmail.com',
      'bn': 'Email : hallie7530@gmail.com',
      'en': 'Email : hallie7530@gmail.com',
      'id': 'Email : hallie7530@gmail.com',
    },
    'n4r7atch': {
      'ko': '주소 : 충남 서산시 대곡2길 15-10',
      'bn': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
      'en': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
      'id': 'Address : 15-10 Daegok 2-gil, Seosan-si, Chungcheongnam-do',
    },
    'ty1wkslr': {
      'ko': 'ㅣ',
      'bn': 'ㅣ',
      'en': 'ㅣ',
      'id': 'ㅣ',
    },
    'x52f11hk': {
      'ko': '개인정보 처리방침',
      'bn': 'গোপনীয়তা নীতি',
      'en': 'privacy policy',
      'id': 'kebijakan privasi',
    },
    'nsdps884': {
      'ko': 'ㅣ',
      'bn': 'ㅣ',
      'en': 'ㅣ',
      'id': 'ㅣ',
    },
    'dzrmoa05': {
      'ko': '서비스 이용약관',
      'bn': 'পরিষেবার শর্তাবলী',
      'en': 'Terms of Service',
      'id': 'Ketentuan Layanan',
    },
    'qz678u2c': {
      'ko': 'ㅣ',
      'bn': 'ㅣ',
      'en': 'ㅣ',
      'id': 'ㅣ',
    },
    '5ef1rfbh': {
      'ko': 'ㅣ',
      'bn': 'ㅣ',
      'en': 'ㅣ',
      'id': 'ㅣ',
    },
    'v6q3lln6': {
      'ko': '배송, 교환, 환불 정책',
      'bn': 'শিপিং, এক্সচেঞ্জ ও ফেরতের নীতি',
      'en': 'Shipping, Exchange, and Refund Policy',
      'id': 'Kebijakan Pengiriman & Pengembalian',
    },
    '78z7gg37': {
      'ko': 'ㅣ',
      'bn': 'ㅣ',
      'en': 'ㅣ',
      'id': 'ㅣ',
    },
    'har0vsm2': {
      'ko':
          '사이버몰 내 판매되는 상품 중에는 할리에 입점한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. 마켓플레이스(오픈마켓) 상품의 경우 할리는 통신판매중개자로서 통신판매의 당사자가 아닙니다. 해당 상품의 거래 전반에 관한 의무와 책임은 각 입점 판매자에게 있습니다.',
      'bn':
          'সাইবারমলের মধ্যে বিক্রি হওয়া কিছু পণ্যের মধ্যে রয়েছে হার্লির সাথে সম্পর্কিত পৃথক বিক্রেতাদের দ্বারা বিক্রি করা মার্কেটপ্লেস (খোলা বাজার) পণ্য। মার্কেটপ্লেস (খোলা বাজার) পণ্যের জন্য, হার্লি একটি মেইল-অর্ডার মধ্যস্থতাকারী হিসেবে কাজ করে এবং অনলাইন বিক্রয় লেনদেনের কোনও পক্ষ নয়। প্রতিটি অংশগ্রহণকারী বিক্রেতা লেনদেনের সাথে সম্পর্কিত সমস্ত বাধ্যবাধকতা এবং দায়িত্বের জন্য দায়ী।',
      'en':
          'Some products sold within the cybermall include marketplace (open market) products sold by individual sellers affiliated with Harley. For marketplace (open market) products, Harley acts as a mail-order intermediary and is not a party to the online sales transaction. Each participating seller is responsible for all obligations and responsibilities related to the transaction.',
      'id':
          'Beberapa produk yang dijual di dalam cybermall mencakup produk pasar terbuka (marketplace) yang dijual oleh penjual individu yang berafiliasi dengan Harley. Untuk produk pasar terbuka, Harley bertindak sebagai perantara pesanan melalui pos dan bukan pihak dalam transaksi penjualan online. Setiap penjual yang berpartisipasi bertanggung jawab atas semua kewajiban dan tanggung jawab yang terkait dengan transaksi tersebut.',
    },
    '0oxr6073': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'jkmajhph': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'tv3ff9sj': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    'hj5hhfxt': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    'r3fexv41': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    'xytuwdsd': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
  },
  // ProductList_category
  {
    'f5p91gas': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'v39pa8ku': {
      'ko': '곧 상품이 추가될 예정이에요 😊',
      'bn': 'শীঘ্রই নতুন পণ্য যোগ করা হবে 😊',
      'en': 'New products will be added soon 😊',
      'id': 'Produk baru akan segera ditambahkan 😊',
    },
    'a1g6vylh': {
      'ko': '이런 추천 상품은 어떠세요?',
      'bn': 'এই প্রস্তাবিত পণ্যগুলি কেমন হবে?',
      'en': 'How about these recommended products?',
      'id': 'Bagaimana dengan produk-produk yang direkomendasikan ini?',
    },
    'o525vloe': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'jtuz5kmn': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Manage_Information
  {
    'ssr3aldy': {
      'ko': '내 정보 관리',
      'bn': 'আমার তথ্য পরিচালনা করুন',
      'en': 'Manage My Information',
      'id': 'Kelola Informasi Saya',
    },
    'wlmm9sut': {
      'ko': '회원 정보 변경',
      'bn': 'প্রোফাইল সম্পাদনা',
      'en': 'Edit Profile',
      'id': 'Edit Profil',
    },
    'qs7ado05': {
      'ko': '배송지 변경',
      'bn': 'ঠিকানা পরিবর্তন করুন',
      'en': 'Change address',
      'id': 'Ubah Alamat',
    },
    'tlgzm74e': {
      'ko': '마케팅 수신 동의',
      'bn': 'মার্কেটিং সম্মতি',
      'en': 'Marketing Consent',
      'id': 'Persetujuan Pemasaran',
    },
    'd2xt9359': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Change_MyInformation
  {
    '6dfs9xm4': {
      'ko': '회원 정보 변경',
      'bn': 'সদস্যের তথ্য পরিবর্তন করুন',
      'en': 'Change member information',
      'id': 'Ubah informasi anggota',
    },
    'vadfgbvi': {
      'ko': '이름',
      'bn': 'নাম',
      'en': 'name',
      'id': 'nama',
    },
    'yzqggttu': {
      'ko': '아이디 (이메일)',
      'bn': 'আইডি (ইমেল)',
      'en': 'ID (Email)',
      'id': 'ID (Email)',
    },
    'so7hd44t': {
      'ko': '휴대폰 번호',
      'bn': 'ফোন নম্বর',
      'en': 'phone number',
      'id': 'nomor telepon',
    },
    '56vy8yw4': {
      'ko': '회원탈퇴',
      'bn': 'সদস্যপদ বাতিল করুন',
      'en': 'Cancel membership',
      'id': 'Batalkan keanggotaan',
    },
    'eqe1c06o': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Address
  {
    'jf5fsj0f': {
      'ko': '배송지 변경',
      'bn': 'ঠিকানা পরিবর্তন',
      'en': 'Change Address',
      'id': 'Ubah alamat',
    },
    'pqt3k7he': {
      'ko': '배송지 추가',
      'bn': 'যোগ করুন',
      'en': 'Add Address',
      'id': 'Tambah',
    },
    '3b4pe7xb': {
      'ko': '기본 배송지',
      'bn': 'ডিফল্ট ঠিকানা',
      'en': 'Default Address',
      'id': 'Alamat Default',
    },
    'x1l1pnwv': {
      'ko': '삭제',
      'bn': 'মুছে ফেলুন',
      'en': 'delete',
      'id': 'Hapus',
    },
    'jpb3gh9z': {
      'ko': '수정',
      'bn': 'সম্পাদনা',
      'en': 'Edit',
      'id': 'Ubah',
    },
    'wleksqki': {
      'ko': '배송지 선택',
      'bn': 'ঠিকানা নির্বাচন করুন',
      'en': 'Select Address',
      'id': 'Pilih Alamat',
    },
    '5vjmwcjb': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // SignUp1
  {
    'i1h2suod': {
      'ko': '회원 가입',
      'bn': 'সদস্যপদে যোগদান করুন',
      'en': 'join the membership',
      'id': 'bergabung menjadi anggota',
    },
    'xsgvlwza': {
      'ko': '아이디 (이메일)',
      'bn': 'আইডি (ইমেল)',
      'en': 'ID (Email)',
      'id': 'ID (Email)',
    },
    'wevrcpoo': {
      'ko': '이메일 입력',
      'bn': 'আপনার ইমেল ঠিকানা লিখুন',
      'en': 'Enter your email address',
      'id': 'Masukkan alamat email Anda',
    },
    '8xbzv65a': {
      'ko': '이름',
      'bn': 'নাম',
      'en': 'name',
      'id': 'nama',
    },
    'z5ucnskb': {
      'ko': '이름을 입력해주세요',
      'bn': 'আপনার নাম লিখুন।',
      'en': 'Please enter your name',
      'id': 'Silakan masukkan nama Anda',
    },
    'nmv85m63': {
      'ko': '비밀번호',
      'bn': 'পাসওয়ার্ড',
      'en': 'password',
      'id': 'kata sandi',
    },
    '7t55ll29': {
      'ko': '8자 영문, 숫자',
      'bn': '৮টি অক্ষর ইংরেজি এবং সংখ্যা',
      'en': '8 characters English and numbers',
      'id': '8 karakter bahasa Inggris dan angka',
    },
    'zdaqtui8': {
      'ko': '비밀번호 확인',
      'bn': 'পাসওয়ার্ড যাচাই করুন',
      'en': 'verify password',
      'id': 'verifikasi kata sandi',
    },
    'g19d27k5': {
      'ko': '8자 영문, 숫자',
      'bn': '৮টি অক্ষর ইংরেজি এবং সংখ্যা',
      'en': '8 characters English and numbers',
      'id': '8 karakter bahasa Inggris dan angka',
    },
    'cbilyogg': {
      'ko': '전체 동의합니다',
      'bn': 'আমি সম্পূর্ণ একমত।',
      'en': 'I completely agree',
      'id': 'Saya sepenuhnya setuju.',
    },
    'c69hrdl9': {
      'ko': '전체동의는 선택목적에 대한 동의를 포함하고 있으며, 선택목적에 대한 동의를 거부해도 서비스를 이용이 가능합니다.',
      'bn':
          'সম্মতি সবকিছুর মধ্যে ঐচ্ছিক সম্মতিও অন্তর্ভুক্ত। ঐচ্ছিক সম্মতি না দিলেও সেবা ব্যবহার করা যাবে।',
      'en':
          'Agreeing to all includes optional consents. You can use the service even if you do not agree to the optional items.',
      'id':
          'Persetujuan semua mencakup persetujuan opsional. Layanan tetap dapat digunakan tanpa persetujuan opsional.',
    },
    'nlbi3r0z': {
      'ko': '(필수) 서비스 이용약관 동의',
      'bn': '(আবশ্যক) শর্তে সম্মতি',
      'en': '(Required) Agree to Terms of Service',
      'id': '(Wajib) Setuju S&K',
    },
    '6ocwdidu': {
      'ko': '보기',
      'bn': 'দেখুন',
      'en': 'look',
      'id': 'Lihat',
    },
    '28p99tf3': {
      'ko': '(필수) 개인정보 수집 및 이용 동의',
      'bn': '(আবশ্যক) গোপনীয়তায় সম্মতি',
      'en': '(Required) Agree to Privacy Policy',
      'id': '(Wajib) Setuju Kebijakan Privasi',
    },
    'b63a6dxc': {
      'ko': '보기',
      'bn': 'দেখুন',
      'en': 'look',
      'id': 'Lihat',
    },
    '94exyhxv': {
      'ko': '(선택) 상품 특가, 할인쿠폰 등 혜택/정보 수신 동의',
      'bn':
          '(ঐচ্ছিক) বিশেষ অফার, ডিসকাউন্ট কুপন ইত্যাদি সুবিধা/তথ্য গ্রহণে সম্মতি',
      'en':
          '(Optional) Agree to receive benefits and information such as special deals and discount coupons',
      'id':
          '(Opsional) Setuju menerima manfaat dan informasi seperti promo khusus dan kupon diskon',
    },
    'mjpp0ifj': {
      'ko': 'Push 알림',
      'bn': 'পুশ',
      'en': 'Push',
      'id': 'Push',
    },
    'xcg4rx5n': {
      'ko': 'SMS',
      'bn': 'এসএমএস',
      'en': 'SMS',
      'id': 'SMS',
    },
    'zhtd668t': {
      'ko': '이메일',
      'bn': 'ইমেইল',
      'en': 'email',
      'id': 'email',
    },
    'wqa0aavq': {
      'ko': '(필수) 만 14세 이상입니다.',
      'bn': '(আবশ্যক) আমার বয়স ১৪ বছর বা তার বেশি।',
      'en': '(Required) I am 14 years old or older.',
      'id': '(Wajib) Berusia 14 tahun atau lebih.',
    },
    '29h6xiym': {
      'ko': '회원 가입',
      'bn': 'সদস্যপদে যোগদান করুন',
      'en': 'join the membership',
      'id': 'bergabung menjadi anggota',
    },
    'y3ezd6kh': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // SelectedAddress
  {
    'x0yq9sg1': {
      'ko': '주소 검색',
      'bn': 'ঠিকানা অনুসন্ধান',
      'en': 'Address Search',
      'id': 'Pencarian Alamat',
    },
    'o0yn0m14': {
      'ko': '주소를 입력하세요',
      'bn': 'আপনার ঠিকানা লিখুন।',
      'en': 'Please enter your address',
      'id': 'Silakan masukkan alamat Anda',
    },
    'tq1nktea': {
      'ko': '도로명',
      'bn': 'রাস্তার নাম',
      'en': 'road name',
      'id': 'nama jalan',
    },
    '4e5ln4tt': {
      'ko': '지번',
      'bn': 'জানুন',
      'en': 'Address',
      'id': 'Alamat',
    },
    'm9lmwqgu': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // navigateHomepage
  {
    'gg2522ex': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Login
  {
    'mgma43dz': {
      'ko': '로그인 / 회원가입',
      'bn': 'লগ ইন / সাইন আপ করুন',
      'en': 'Log in / Sign up',
      'id': 'Masuk / Daftar',
    },
    '760utijc': {
      'ko': '아이디 (이메일)',
      'bn': 'আইডি (ইমেল)',
      'en': 'ID (Email)',
      'id': 'ID (Email)',
    },
    'y36oyjch': {
      'ko': '이메일 입력',
      'bn': 'আপনার ইমেল ঠিকানা লিখুন',
      'en': 'Enter your email address',
      'id': 'Masukkan alamat email Anda',
    },
    'onq2tcjt': {
      'ko': '비밀번호',
      'bn': 'পাসওয়ার্ড',
      'en': 'password',
      'id': 'kata sandi',
    },
    'y5hj94fy': {
      'ko': '8자 영문, 숫자',
      'bn': '৮টি অক্ষর ইংরেজি এবং সংখ্যা',
      'en': '8 characters English and numbers',
      'id': '8 karakter bahasa Inggris dan angka',
    },
    'o0qps58l': {
      'ko': '로그인',
      'bn': 'লগ ইন করুন',
      'en': 'log in',
      'id': 'masuk',
    },
    'ph8zc6ov': {
      'ko': 'Apple로 로그인',
      'bn': 'Apple দিয়ে লগইন করুন',
      'en': 'Sign in with Apple',
      'id': 'Masuk dengan Apple',
    },
    'wqx25fcf': {
      'ko': 'Google 계정으로 로그인',
      'bn': 'Google দিয়ে লগইন করুন',
      'en': 'Sign in with Google',
      'id': 'Masuk dengan Google',
    },
    'f6izrooq': {
      'ko': 'Facebook으로 로그인',
      'bn': 'ফেসবুক দিয়ে লগ ইন করুন',
      'en': 'Log in with Facebook',
      'id': 'Masuk dengan Facebook',
    },
    'mf4zo94h': {
      'ko': '회원 가입',
      'bn': 'সাইন আপ করুন',
      'en': 'Sign up',
      'id': 'Daftar',
    },
    'v15c0iyg': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Add_Address
  {
    'p1vq56we': {
      'ko': '배송지 추가',
      'bn': 'ঠিকানা যোগ করুন',
      'en': 'Add Address',
      'id': 'Tambah Alamat',
    },
    'woshg9jo': {
      'ko': '이름',
      'bn': 'নাম',
      'en': 'name',
      'id': 'nama',
    },
    'wvro0rcb': {
      'ko': '받는 분의 이름을 입력해주세요',
      'bn': 'দয়া করে প্রাপকের নাম লিখুন।',
      'en': 'Please enter the recipient\'s name',
      'id': 'Silakan masukkan nama penerima.',
    },
    'oaexxiev': {
      'ko': '휴대폰 번호',
      'bn': 'ফোন নম্বর',
      'en': 'phone number',
      'id': 'nomor telepon',
    },
    '6kniyorb': {
      'ko': '휴대폰번호를 입력해주세요',
      'bn': 'আপনার মোবাইল ফোন নম্বরটি লিখুন।',
      'en': 'Please enter your mobile phone number',
      'id': 'Silakan masukkan nomor ponsel Anda',
    },
    'hpi5joz1': {
      'ko': '주소',
      'bn': 'ঠিকানা',
      'en': 'address',
      'id': 'alamat',
    },
    '7x5mpuhi': {
      'ko': '상세주소',
      'bn': 'বিস্তারিত ঠিকানা',
      'en': 'Detailed address',
      'id': 'Alamat lengkap',
    },
    '10ax17r6': {
      'ko': '기본 배송지로 설정',
      'bn': 'ডিফল্ট ঠিকানা',
      'en': 'Default Address',
      'id': 'Alamat Default',
    },
    'x0tejfq2': {
      'ko': '배송지 추가',
      'bn': 'ঠিকানা যোগ করুন',
      'en': 'Add Address',
      'id': 'Tambah Alamat',
    },
    'dgn779xl': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Address_Refresh
  {
    'xx0r2rls': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Edit_Address
  {
    'ilyzcjgp': {
      'ko': '배송지 수정',
      'bn': 'ডেলিভারির ঠিকানা পরিবর্তন করুন',
      'en': 'Change delivery address',
      'id': 'Ubah alamat pengiriman',
    },
    'yslapny2': {
      'ko': '이름',
      'bn': 'নাম',
      'en': 'name',
      'id': 'nama',
    },
    '19k69yy9': {
      'ko': '받는 분의 이름을 입력해주세요',
      'bn': 'দয়া করে প্রাপকের নাম লিখুন।',
      'en': 'Please enter the recipient\'s name',
      'id': 'Silakan masukkan nama penerima.',
    },
    't2iejjko': {
      'ko': '휴대폰 번호',
      'bn': 'ফোন নম্বর',
      'en': 'phone number',
      'id': 'nomor telepon',
    },
    'qzzxzmr8': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '4xlmv1pc': {
      'ko': '휴대폰번호를 입력해주세요',
      'bn': 'আপনার মোবাইল ফোন নম্বরটি লিখুন।',
      'en': 'Please enter your mobile phone number',
      'id': 'Silakan masukkan nomor ponsel Anda',
    },
    'azs644oa': {
      'ko': '주소',
      'bn': 'ঠিকানা',
      'en': 'address',
      'id': 'alamat',
    },
    'hyauot1f': {
      'ko': '상세주소',
      'bn': 'বিস্তারিত ঠিকানা',
      'en': 'Detailed address',
      'id': 'Alamat lengkap',
    },
    'y38vvml3': {
      'ko': '배송지 수정',
      'bn': 'ডেলিভারির ঠিকানা পরিবর্তন করুন',
      'en': 'Change delivery address',
      'id': 'Ubah alamat pengiriman',
    },
    'dzm2x6xl': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // OrderDetail
  {
    'fymhdkbk': {
      'ko': '주문 상세',
      'bn': 'অর্ডারের বিবরণ',
      'en': 'Order Details',
      'id': 'Detail Pesanan',
    },
    'ebb7l64k': {
      'ko': '고객님의 요청으로 취소된 상품입니다.',
      'bn': 'গ্রাহকের অনুরোধে এই পণ্যটি বাতিল করা হয়েছে।',
      'en': 'This product has been cancelled at the customer\'s request.',
      'id': 'Produk ini telah dibatalkan atas permintaan pelanggan.',
    },
    'k3lklkhg': {
      'ko': '사유 : ',
      'bn': 'কারণ : ',
      'en': 'reason : ',
      'id': 'alasan : ',
    },
    'r4fgjda7': {
      'ko': '주문 상품',
      'bn': 'অর্ডার করা পণ্য',
      'en': 'Ordered products',
      'id': 'Produk yang dipesan',
    },
    '9bp8hmz5': {
      'ko': '장바구니 담기',
      'bn': 'কার্টে যোগ করুন',
      'en': 'Add to Cart',
      'id': 'Tambah ke Keranjang',
    },
    'fm0d5fq0': {
      'ko': '배송지 정보',
      'bn': 'ডেলিভারি তথ্য',
      'en': 'Delivery information',
      'id': 'Informasi pengiriman',
    },
    'o1c20xao': {
      'ko': '결제 정보',
      'bn': 'পেমেন্ট তথ্য',
      'en': 'Payment Information',
      'id': 'Informasi Pembayaran',
    },
    'eemy7mia': {
      'ko': '총 상품 금액',
      'bn': 'মোট পণ্যের দাম',
      'en': 'Total product price',
      'id': 'Harga total produk',
    },
    'rsmobbki': {
      'ko': '쿠폰 할인',
      'bn': 'কুপন ছাড়',
      'en': 'Coupon discount',
      'id': 'Diskon kupon',
    },
    'ryi8i085': {
      'ko': '포인트 할인',
      'bn': 'পয়েন্ট ছাড়',
      'en': 'Point discount',
      'id': 'Diskon poin',
    },
    'd5uawj3m': {
      'ko': '배송비',
      'bn': 'ডেলিভারি ফি',
      'en': 'delivery fee',
      'id': 'biaya pengiriman',
    },
    'v072whkn': {
      'ko': '총 결제 금액',
      'bn': 'মোট পেমেন্টের পরিমাণ',
      'en': 'Total payment amount',
      'id': 'Jumlah total pembayaran',
    },
    'xyug8lal': {
      'ko': '주문 취소',
      'bn': 'অর্ডার বাতিল করুন',
      'en': 'cancel order',
      'id': 'Batalkan Pesanan',
    },
    'a82hygzj': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Cart_Refresh
  {
    'shun5obj': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // OrderList
  {
    '4xb3nzu4': {
      'ko': '주문 내역',
      'bn': 'অর্ডারের ইতিহাস',
      'en': 'Order History',
      'id': 'Riwayat Pesanan',
    },
    'vft1lmvg': {
      'ko': '주문 상세 보기 >',
      'bn': 'অর্ডারের বিবরণ >',
      'en': 'order details >',
      'id': 'detail pesanan >',
    },
    'du3ubsem': {
      'ko': '고객님의 요청으로 취소된 상품입니다.',
      'bn': 'আপনার অনুরোধ অনুযায়ী এই পণ্যটি বাতিল করা হয়েছে।',
      'en': 'This Item was cancelled per your request.',
      'id': 'Barang ini dibatalkan atas permintaan Anda.',
    },
    'ro92gvi7': {
      'ko': '장바구니 담기',
      'bn': 'কার্টে যোগ করুন',
      'en': 'Add to Cart',
      'id': 'Tambah ke Keranjang',
    },
    'jpsxxopo': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // paymentsuccess
  {
    'k91vlns7': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // DeliverySearch
  {
    '92zkezop': {
      'ko': '배송 조회',
      'bn': 'ডেলিভারি ট্র্যাকিং',
      'en': 'delivery tracking',
      'id': 'pelacakan pengiriman',
    },
    'sddx4nfw': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // ProductList_search
  {
    '0yj4lkp9': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'pp6feu5b': {
      'ko': '원하시는 상품을 찾지 못했어요😢',
      'bn': 'আপনি যে পণ্যটি খুঁজছেন তা পাওয়া যায়নি 😢',
      'en': 'We couldn’t find what you’re looking for 😢',
      'id': 'Kami tidak dapat menemukan produk yang Anda cari 😢',
    },
    '06hvjxo9': {
      'ko': '이런 추천 상품은 어떠세요?',
      'bn': 'এই প্রস্তাবিত পণ্যগুলি কেমন হবে?',
      'en': 'How about these recommended products?',
      'id': 'Bagaimana dengan produk-produk yang direkomendasikan ini?',
    },
    'fixrquch': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'd8qdj4a0': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // AllProducts
  {
    '0yr4jpsb': {
      'ko': '모든 상품',
      'bn': 'সকল পণ্য',
      'en': 'All products',
      'id': 'Semua produk',
    },
    'e968nfxp': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'w24azztw': {
      'ko': '%',
      'bn': '%',
      'en': '%',
      'id': '%',
    },
    'om14mtc0': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'bgro0x2c': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'orsjanr1': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    '66jyi5ft': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    'rl3ydc0c': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    '7zh6q6lp': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Review
  {
    '6f34kq7d': {
      'ko': '상품 후기 작성',
      'bn': 'রিভিউ লিখুন',
      'en': 'write a review',
      'id': 'Tulis Ulasan',
    },
    'g8ews46f': {
      'ko': '사진+후기 작성 시 100포인트 적립',
      'bn': 'ফটো ও টেক্সট রিভিউয়ের জন্য ১০০ পয়েন্ট!',
      'en': '100 points for photo & text review!',
      'id': '100 poin untuk ulasan foto & teks!',
    },
    'hac7gay1': {
      'ko': '이 상품의 후기를 남겨주세요!',
      'bn': 'এই পণ্যটির জন্য একটি পর্যালোচনা দিন!',
      'en': 'Please leave a review for this product!',
      'id': 'Silakan berikan ulasan untuk produk ini!',
    },
    'skqb5e74': {
      'ko': '사진 등록',
      'bn': 'একটি ছবি নিবন্ধন করুন',
      'en': 'Register a photo',
      'id': 'Daftarkan foto',
    },
    'vtwwprbe': {
      'ko': 'P ',
      'bn': 'প',
      'en': 'P',
      'id': 'P',
    },
    '4ixjc0ax': {
      'ko': '/ 150P',
      'bn': '/ ১৫০পি',
      'en': '/ 150P',
      'id': '/ 150P',
    },
    'butpdus4': {
      'ko': '리뷰 등록',
      'bn': 'একটি পর্যালোচনা নিবন্ধন করুন',
      'en': 'Register a review',
      'id': 'Berikan ulasan',
    },
    'ts93dan3': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Marketing_Push
  {
    'lw8p9xh4': {
      'ko': '마케팅 수신 동의',
      'bn': 'মার্কেটিং সম্মতি',
      'en': 'Marketing Consent',
      'id': 'Persetujuan Pemasaran',
    },
    'bhaa53ws': {
      'ko': '푸시 알림',
      'bn': 'পুশ',
      'en': 'Push',
      'id': 'Push',
    },
    'hp8rx6zg': {
      'ko': '문자 알림',
      'bn': 'টেক্সট বিজ্ঞপ্তি',
      'en': 'SMS',
      'id': 'SMS',
    },
    '8zzqe89k': {
      'ko': '이메일 알림',
      'bn': 'ইমেল',
      'en': 'Email',
      'id': 'Email',
    },
    'b7vr7raz': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // checkout2
  {
    '2tfinotk': {
      'ko': '주문',
      'bn': 'অর্ডার',
      'en': 'order',
      'id': 'memesan',
    },
    'jv6egms2': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Language
  {
    'f2174zew': {
      'ko': '언어 / Language',
      'bn': '언어 / Language',
      'en': '언어 / Language',
      'id': '언어 / Language',
    },
    'lwk85mav': {
      'ko': '한국어',
      'bn': '한국어',
      'en': '한국어',
      'id': '한국어',
    },
    'm21ak1yw': {
      'ko': 'English',
      'bn': 'English',
      'en': 'English',
      'id': 'English',
    },
    '6s4h6e8p': {
      'ko': 'Indonesian',
      'bn': 'Indonesian',
      'en': 'Indonesian',
      'id': 'Indonesian',
    },
    'fxqlfg6p': {
      'ko': 'বাংলা',
      'bn': 'বাংলা',
      'en': 'বাংলা',
      'id': 'বাংলা',
    },
    'c61kqwxl': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // term
  {
    'dkpuc1ti': {
      'ko': '서비스 이용약관',
      'bn': 'পরিষেবার শর্তাবলী',
      'en': 'Terms of Service',
      'id': 'Ketentuan Layanan',
    },
    'ib3u5zfe': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // privacy
  {
    'vri9pndn': {
      'ko': '개인정보 처리방침',
      'bn': 'গোপনীয়তা নীতি',
      'en': 'privacy policy',
      'id': 'kebijakan privasi',
    },
    'e27zehbj': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Reviewlist
  {
    '1kp9l72m': {
      'ko': '리뷰',
      'bn': 'পর্যালোচনা',
      'en': 'review',
      'id': 'tinjauan',
    },
    'fdzaq0mu': {
      'ko': '5점',
      'bn': '৫ পয়েন্ট',
      'en': '5 points',
      'id': '5 poin',
    },
    '3nfe1css': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '551eabga': {
      'ko': '4점',
      'bn': '৪ পয়েন্ট',
      'en': '4 points',
      'id': '4 poin',
    },
    '4hmrfpob': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '8xcztumk': {
      'ko': '3점',
      'bn': '৩ পয়েন্ট',
      'en': '3 points',
      'id': '3 poin',
    },
    'ad6mictm': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'nblavimp': {
      'ko': '2점',
      'bn': '২ পয়েন্ট',
      'en': '2 points',
      'id': '2 poin',
    },
    '6a6orcqa': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '691jnulz': {
      'ko': '1점',
      'bn': '১ পয়েন্ট',
      'en': '1 point',
      'id': '1 poin',
    },
    '91l53ax7': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'r19n2gmc': {
      'ko': '추천순',
      'bn': 'প্রস্তাবিত',
      'en': 'Recommended',
      'id': 'Direkomendasikan',
    },
    'q4x2nrfi': {
      'ko': 'Option 1',
      'bn': 'প্রস্তাবিত',
      'en': 'Recommended',
      'id': 'Direkomendasikan',
    },
    'lmhhcpv8': {
      'ko': 'Search...',
      'bn': 'অনুসন্ধান...',
      'en': 'Search...',
      'id': 'Mencari...',
    },
    'ur8vpxb7': {
      'ko': '추천순',
      'bn': 'প্রস্তাবিত',
      'en': 'Recommended',
      'id': 'Rekom',
    },
    '5xmrfmv9': {
      'ko': '최신순',
      'bn': 'সর্বশেষ',
      'en': 'Newest',
      'id': 'Terbaru',
    },
    's8uzpkr1': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // MyReviews
  {
    'vq8395ih': {
      'ko': '작성한 리뷰',
      'bn': 'আমার রিভিউ',
      'en': 'My reviews',
      'id': 'Ulasan Saya',
    },
    '0t58qqya': {
      'ko': '삭제하기',
      'bn': 'মুছে ফেলুন',
      'en': 'Delete',
      'id': 'Menghapus',
    },
    'nxwrhgrj': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // navigateMyReviews
  {
    'hyd5qhnk': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // OrderCancel
  {
    '2ov1ufa6': {
      'ko': '주문 취소',
      'bn': 'অর্ডার বাতিল করুন',
      'en': 'Cancel Order',
      'id': 'Batalkan Pesanan',
    },
    'd5hyh129': {
      'ko': '주문 취소 후 3일 이내에 결제 금액이 환불됩니다.',
      'bn': 'অর্ডার বাতিলের ৩ দিনের মধ্যে আপনার পেমেন্ট ফেরত দেওয়া হবে।',
      'en':
          'Your payment will be refunded within 3 days of your order cancellation.',
      'id':
          'Pembayaran Anda akan dikembalikan dalam waktu 3 hari setelah pembatalan pesanan Anda.',
    },
    'ssmj0blu': {
      'ko': '주문 상품',
      'bn': 'অর্ডার করা পণ্য',
      'en': 'Ordered products',
      'id': 'Produk yang dipesan',
    },
    'ftknwav1': {
      'ko': '취소 사유',
      'bn': 'বাতিলের কারণ',
      'en': 'Reason for cancellation',
      'id': 'Alasan pembatalan',
    },
    'hr9t52eg': {
      'ko': '상품이 마음에 들지 않음',
      'bn': 'পণ্য সন্তোষজনক নয়',
      'en': 'Product Not Satisfactory',
      'id': 'Produk Tidak Memuaskan',
    },
    'ljl966si': {
      'ko': '배송이 늦음',
      'bn': 'ডেলিভারি বিলম্বিত',
      'en': 'Delayed Delivery',
      'id': 'Pengiriman Tertunda',
    },
    '2w0t4ffw': {
      'ko': '가격 문제',
      'bn': 'দাম ইস্যু',
      'en': 'Price issue',
      'id': 'Masalah harga',
    },
    'hktxzeji': {
      'ko': '다른 상품으로 교환 원함',
      'bn': 'এক্সচেঞ্জ অনুরোধ করুন',
      'en': 'Request Exchange',
      'id': 'Minta Penukaran',
    },
    '7ham434o': {
      'ko': '기타 사유',
      'bn': 'অন্যান্য কারণ',
      'en': 'Other reason',
      'id': 'Alasan lain',
    },
    'kd3ksv4a': {
      'ko': '취소 사유를 입력해주세요',
      'bn': 'আপনার কারণ লিখুন',
      'en': 'Please enter your reason',
      'id': 'Masukkan alasan Anda',
    },
    'ghpu2976': {
      'ko': '환불 안내',
      'bn': 'রিফান্ড তথ্য',
      'en': 'Refund Information',
      'id': 'Informasi Pengembalian Dana',
    },
    'ry6pejsy': {
      'ko': '총 상품 금액',
      'bn': 'মোট পণ্যের দাম',
      'en': 'Total product price',
      'id': 'Harga total produk',
    },
    'nt9u5trb': {
      'ko': '쿠폰 할인',
      'bn': 'কুপন ছাড়',
      'en': 'Coupon discount',
      'id': 'Diskon kupon',
    },
    'ryk3jxxy': {
      'ko': '포인트 할인',
      'bn': 'পয়েন্ট ছাড়',
      'en': 'Point discount',
      'id': 'Diskon poin',
    },
    'ql4ycnko': {
      'ko': '배송비',
      'bn': 'ডেলিভারি ফি',
      'en': 'delivery fee',
      'id': 'biaya pengiriman',
    },
    'is7dhggv': {
      'ko': '총 결제 금액',
      'bn': 'মোট পেমেন্টের পরিমাণ',
      'en': 'Total payment amount',
      'id': 'Jumlah total pembayaran',
    },
    'bx6mvjxg': {
      'ko': '주문 취소',
      'bn': 'অর্ডার বাতিল করুন',
      'en': 'Cancel Order',
      'id': 'Batalkan Pesanan',
    },
    'q4sl6yoy': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // coupon_list
  {
    'v4wmomjm': {
      'ko': '쿠폰',
      'bn': 'কুপন',
      'en': 'coupon',
      'id': 'kupon',
    },
    'qtjc833n': {
      'ko': '내 쿠폰',
      'bn': 'আমার কুপন',
      'en': 'My coupon',
      'id': 'Kupon saya',
    },
    'fd9h9fnq': {
      'ko': ' 할인',
      'bn': 'ছাড়',
      'en': 'discount',
      'id': 'diskon',
    },
    'lpzpnwub': {
      'ko': ' 만료',
      'bn': 'মেয়াদোত্তীর্ণ',
      'en': 'expiration',
      'id': 'kedaluwarsa',
    },
    '6zkty2u8': {
      'ko': '상품보기',
      'bn': 'পণ্য দেখুন',
      'en': 'View Products',
      'id': 'Lihat Produk',
    },
    'uxlfilid': {
      'ko': '사용 완료 / 만료',
      'bn': 'ব্যবহার / শেষ',
      'en': 'Used / Expired',
      'id': 'Pakai / Exp',
    },
    '78b381w6': {
      'ko': ' 할인',
      'bn': 'ছাড়',
      'en': 'discount',
      'id': 'diskon',
    },
    'fif8g314': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // Mypoint
  {
    'sh96smhp': {
      'ko': '포인트',
      'bn': 'বিন্দু',
      'en': 'point',
      'id': 'titik',
    },
    'jejylr2m': {
      'ko': '현재 포인트',
      'bn': 'বর্তমান পয়েন্ট',
      'en': 'Current points',
      'id': 'Poin terkini',
    },
    '7tsmm9v0': {
      'ko': 'P',
      'bn': 'প',
      'en': 'P',
      'id': 'P',
    },
    'ec8j4w6s': {
      'ko': '자세히 보기 >',
      'bn': 'আরও জানুন >',
      'en': 'Learn more >',
      'id': 'Pelajari selengkapnya >',
    },
    'q2ua6kxq': {
      'ko': '+',
      'bn': '+',
      'en': '+',
      'id': '+',
    },
    'ihu3slz4': {
      'ko': 'P',
      'bn': 'প',
      'en': 'P',
      'id': 'P',
    },
    '9a0klvky': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // HalalCert
  {
    'fyttn6f4': {
      'ko': '할랄 인증 확인',
      'bn': 'হালাল সার্টিফিকেশন যাচাইকরণ',
      'en': 'Halal Certification Verification',
      'id': 'Verifikasi Sertifikasi Halal',
    },
    'yzkqev34': {
      'ko': '2022~2025년 KMF 할랄 인증 제품 목록 연동 데이터입니다.',
      'bn':
          'এটি ২০২২ থেকে ২০২৫ সাল পর্যন্ত KMF হালাল প্রত্যয়িত পণ্য তালিকার লিঙ্কযুক্ত ডেটা।',
      'en':
          'This is the linked data for the KMF Halal certified product list from 2022 to 2025.',
      'id':
          'Berikut adalah data terkait untuk daftar produk bersertifikasi Halal KMF dari tahun 2022 hingga 2025.',
    },
    '5s8un1xf': {
      'ko': '할랄 인증',
      'bn': 'হালাল সার্টিফিকেশন',
      'en': 'Halal certification',
      'id': 'Sertifikasi Halal',
    },
    'd6zwpbsf': {
      'ko': '인증번호',
      'bn': 'প্রমাণীকরণ নম্বর',
      'en': 'Authentication number',
      'id': 'Nomor otentikasi',
    },
    'mrro0ux1': {
      'ko': '회사',
      'bn': 'কোম্পানি',
      'en': 'company',
      'id': 'perusahaan',
    },
    'ycyn2omc': {
      'ko': '상품명',
      'bn': 'পণ্যের নাম',
      'en': 'Product name',
      'id': 'Nama Produk',
    },
    'p0034vpb': {
      'ko': '발급일 / 만료일',
      'bn': 'ইস্যু তারিখ / মেয়াদ শেষ হওয়ার তারিখ',
      'en': 'Issue date / Expiration date',
      'id': 'Tanggal penerbitan / Tanggal kedaluwarsa',
    },
    '5feoq8gj': {
      'ko': '할랄 인증서',
      'bn': 'হালাল সার্টিফিকেট',
      'en': 'Halal certificate',
      'id': 'Sertifikat Halal',
    },
    'tvmbopci': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // deliverypolicy
  {
    '6caa7iso': {
      'ko': '배송, 교환, 환불 정책',
      'bn': 'ডেলিভারি নীতি',
      'en': 'Shipping Policy',
      'id': 'Kebijakan Pengiriman',
    },
    '1zcwfnhx': {
      'ko': '교환/반품 안내',
      'bn': 'বিনিময়/প্রত্যাবর্তনের তথ্য',
      'en': 'Exchange/Return Information',
      'id': 'Informasi Penukaran/Pengembalian',
    },
    '3cw2wisv': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '6bj2748t': {
      'ko':
          '상품이 표시·광고 내용과 다르거나, 오배송, 파손, 불량, 유통기한 문제 등 결함이 있는 경우, 상품 수령일로부터 3개월 이내 교환 또는 환불을 요청하실 수 있습니다.',
      'bn':
          'যদি পণ্যটি বিজ্ঞাপন বা প্রদর্শিত পণ্যের থেকে ভিন্ন হয়, অথবা ত্রুটিপূর্ণ হয় (যেমন, ভুলভাবে সরবরাহ করা হয়েছে, ক্ষতিগ্রস্ত হয়েছে, ত্রুটিপূর্ণ হয়েছে, অথবা মেয়াদ শেষ হওয়ার তারিখের সমস্যা আছে), তাহলে আপনি পণ্যটি প্রাপ্তির তারিখ থেকে 3 মাসের মধ্যে বিনিময় বা ফেরতের অনুরোধ করতে পারেন।',
      'en':
          'If the product is different from what was advertised or displayed, or is defective (e.g., incorrectly delivered, damaged, defective, or has an expiration date issue), you may request an exchange or refund within 3 months from the date of receipt of the product.',
      'id':
          'Jika produk berbeda dari yang diiklankan atau ditampilkan, atau cacat, misalnya karena pengiriman yang salah, kerusakan, cacat, atau tanggal kedaluwarsa, Anda dapat meminta penukaran atau pengembalian dana dalam waktu 3 bulan sejak tanggal penerimaan produk.',
    },
    'bii6owfy': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '007k00mo': {
      'ko': '상품 불량 또는 하자 확인을 위해 문제를 확인할 수 있는 사진 촬영 후 고객센터로 문의해 주시기 바랍니다.',
      'bn':
          'পণ্যটি ত্রুটিপূর্ণ বা ক্ষতিগ্রস্ত কিনা তা নিশ্চিত করতে, অনুগ্রহ করে এমন ছবি তুলুন যা সমস্যাটি নিশ্চিত করতে পারে এবং গ্রাহক পরিষেবা কেন্দ্রে যোগাযোগ করুন।',
      'en':
          'To confirm whether the product is defective or damaged, please take photos that can confirm the problem and contact the customer service center.',
      'id':
          'Untuk memastikan apakah produk tersebut cacat atau rusak, harap ambil foto yang dapat membuktikan masalah tersebut dan hubungi pusat layanan pelanggan.',
    },
    'ugdj98yp': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '7zy3janc': {
      'ko': '수령 즉시 확인 가능한 문제(누락, 파손, 냉해 등)는 상품 수령일로부터 7일 이내 문의 시 처리가 가능합니다.',
      'bn':
          'পণ্যটি প্রাপ্তির ৭ দিনের মধ্যে আমাদের সাথে যোগাযোগ করলে, প্রাপ্তির সাথে সাথেই নিশ্চিত হতে পারে এমন যেকোনো সমস্যা (নিখোঁজ জিনিসপত্র, ক্ষতি, ঠান্ডাজনিত ক্ষতি ইত্যাদি) সমাধান করা যেতে পারে।',
      'en':
          'Any issues that can be confirmed immediately upon receipt (missing items, damage, cold damage, etc.) can be addressed if you contact us within 7 days of receiving the product.',
      'id':
          'Segala masalah yang dapat dikonfirmasi segera setelah diterima (barang hilang, kerusakan, kerusakan akibat suhu dingin, dll.) dapat ditangani jika Anda menghubungi kami dalam waktu 7 hari setelah menerima produk.',
    },
    'fxt688tl': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'nkjynhhf': {
      'ko':
          '결함이 없는 상품의 경우에도, 미개봉 및 미사용 상태의 새 제품에 한해 상품 수령일로부터 7일 이내 교환 또는 반품 신청이 가능합니다.',
      'bn':
          'এমনকি ত্রুটিবিহীন পণ্যের ক্ষেত্রেও, প্রাপ্তির তারিখ থেকে ৭ দিনের মধ্যে বিনিময় বা ফেরত দেওয়া সম্ভব, যদি পণ্যটি নতুন, খোলা না থাকে এবং অব্যবহৃত থাকে।',
      'en':
          'Even for products without defects, exchanges or returns are possible within 7 days from the date of receipt, provided the product is new, unopened, and unused.',
      'id':
          'Bahkan untuk produk tanpa cacat, penukaran atau pengembalian dimungkinkan dalam waktu 7 hari sejak tanggal penerimaan, dengan syarat produk tersebut masih baru, belum dibuka, dan belum digunakan.',
    },
    'dmcf94ol': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'codzq8zf': {
      'ko': '기타 상품 결함에 대한 보상은 소비자분쟁해결기준(공정거래위원회 고시)에 따라 처리됩니다.',
      'bn':
          'অন্যান্য পণ্যের ত্রুটির জন্য ক্ষতিপূরণ গ্রাহক বিরোধ নিষ্পত্তি মানদণ্ড (ফেয়ার ট্রেড কমিশন নোটিশ) অনুসারে প্রক্রিয়া করা হবে।',
      'en':
          'Compensation for other product defects will be processed in accordance with the Consumer Dispute Resolution Standards (Fair Trade Commission Notice).',
      'id':
          'Ganti rugi atas cacat produk lainnya akan ditangani sesuai dengan Standar Penyelesaian Sengketa Konsumen (Pemberitahuan Komisi Perdagangan Adil).',
    },
    'o019whvk': {
      'ko': '교환/반품 불가 안내',
      'bn': 'অ-বিনিময়যোগ্য/অ-ফেরতযোগ্য পণ্য সম্পর্কিত তথ্য',
      'en': 'Information on non-exchangeable/non-returnable items',
      'id': 'Informasi mengenai barang yang tidak dapat ditukar/dikembalikan',
    },
    '3o2qkr0c': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'z126xa6w': {
      'ko': '신선/냉장/냉동식품은 단순 변심, 주문 착오 등 고객 사유에 의한 교환 및 반품이 제한될 수 있습니다.',
      'bn':
          'গ্রাহকের সাধারণ মন পরিবর্তন বা অর্ডার করার সময় ত্রুটির মতো কারণে তাজা/ফ্রিজ/হিমায়িত খাবারের বিনিময় এবং ফেরত সীমাবদ্ধ করা হতে পারে।',
      'en':
          'Exchanges and returns of fresh/refrigerated/frozen foods may be restricted due to customer reasons such as simple change of mind or ordering error.',
      'id':
          'Penukaran dan pengembalian makanan segar/dingin/beku mungkin dibatasi karena alasan pelanggan seperti perubahan pikiran atau kesalahan pemesanan.',
    },
    '69r11bxo': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'm8i7wc3w': {
      'ko': '고객의 보관 부주의 또는 잘못된 보관 방법으로 인한 오염, 파손, 변질된 경우 교환 및 반품이 불가합니다.',
      'bn':
          'গ্রাহকের অবহেলা বা ভুল সংরক্ষণ পদ্ধতির কারণে পণ্যটি দূষিত, ক্ষতিগ্রস্ত বা খারাপ হয়ে গেলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'Exchanges and returns are not possible if the product is contaminated, damaged, or deteriorated due to the customer\'s negligence or incorrect storage methods.',
      'id':
          'Penukaran dan pengembalian tidak dimungkinkan jika produk terkontaminasi, rusak, atau mengalami penurunan kualitas akibat kelalaian pelanggan atau metode penyimpanan yang salah.',
    },
    '7uz3axe3': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '0stlagi6': {
      'ko': '고객의 사용 또는 일부 소비로 상품의 가치가 훼손된 경우 교환 및 반품이 불가합니다.',
      'bn':
          'গ্রাহকের ব্যবহারের কারণে বা আংশিক ব্যবহারের কারণে পণ্যের মূল্য ক্ষতিগ্রস্ত হলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'Exchanges and returns are not possible if the value of the product has been damaged due to the customer\'s use or partial consumption.',
      'id':
          'Penukaran dan pengembalian tidak dimungkinkan jika nilai produk telah rusak karena penggunaan atau konsumsi sebagian oleh pelanggan.',
    },
    'vabctpjx': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '2siuwc2n': {
      'ko':
          '상품 포장을 개봉하여 사용 또는 설치가 완료되어 재판매가 불가능한 경우 교환 및 반품이 불가합니다.\n(단, 내용 확인을 위한 포장 개봉은 예외로 합니다.)',
      'bn':
          'যদি পণ্যের প্যাকেজিং খোলা, ব্যবহার করা বা ইনস্টল করা হয়ে থাকে এবং পুনরায় বিক্রি করা না যায়, তাহলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়। (তবে, বিষয়বস্তু পরীক্ষা করার জন্য প্যাকেজিং খোলা একটি ব্যতিক্রম।)',
      'en':
          'If the product packaging has been opened, used, or installed, and cannot be resold, exchanges and returns are not possible. (However, opening the packaging to check the contents is an exception.)',
      'id':
          'Jika kemasan produk telah dibuka, digunakan, atau dipasang, dan tidak dapat dijual kembali, penukaran dan pengembalian tidak dimungkinkan. (Namun, membuka kemasan untuk memeriksa isinya merupakan pengecualian.)',
    },
    'mjwiwmwp': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'hl53j0vg': {
      'ko': '시간 경과에 따라 상품의 가치가 현저히 감소하여 재판매가 불가능한 경우 교환 및 반품이 불가합니다.',
      'bn':
          'যদি সময়ের সাথে সাথে পণ্যের মূল্য উল্লেখযোগ্যভাবে হ্রাস পায় এবং পণ্যটি পুনরায় বিক্রি করা না যায়, তাহলে বিনিময় এবং ফেরত দেওয়া সম্ভব নয়।',
      'en':
          'If the value of the product has significantly decreased over time and the product cannot be resold, exchanges and returns are not possible.',
      'id':
          'Jika nilai produk telah menurun secara signifikan seiring waktu dan produk tersebut tidak dapat dijual kembali, maka penukaran dan pengembalian tidak dimungkinkan.',
    },
    'm84llsjx': {
      'ko': '교환/반품 처리 안내',
      'bn': 'বিনিময়/প্রত্যাবর্তন প্রক্রিয়াকরণ নির্দেশিকা',
      'en': 'Exchange/Return Processing Guide',
      'id': 'Panduan Pemrosesan Penukaran/Pengembalian',
    },
    'dwvq5y35': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '1gfed631': {
      'ko': '상품의 하자 또는 오배송 등 결함이 확인된 경우 반품 배송비는 판매자가 부담합니다.',
      'bn':
          'যদি কোনও ত্রুটি নিশ্চিত হয়, যেমন একটি ত্রুটিপূর্ণ পণ্য বা ভুল ডেলিভারি, তাহলে বিক্রেতা ফেরত পাঠানোর খরচের জন্য দায়ী থাকবে।',
      'en':
          'If a defect is confirmed, such as a defective product or incorrect delivery, the seller will be responsible for the return shipping costs.',
      'id':
          'Jika kerusakan terkonfirmasi, seperti produk cacat atau pengiriman yang salah, penjual akan bertanggung jawab atas biaya pengiriman pengembalian.',
    },
    'p0fdwipi': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'm8tx08y1': {
      'ko': '단순 변심에 의한 반품의 경우 재입고 수수료 6,000원이 부과될 수 있으며, 반품 배송비는 고객 부담입니다.',
      'bn':
          'যদি মন পরিবর্তনের কারণে ফেরত দেওয়া হয়, তাহলে ৬,০০০ ওন রিস্টকিং ফি নেওয়া যেতে পারে এবং ফেরত পাঠানোর খরচের জন্য গ্রাহক দায়ী থাকবেন।',
      'en':
          'In case of returns due to simple change of mind, a restocking fee of 6,000 won may be charged, and the customer is responsible for return shipping costs.',
      'id':
          'Dalam hal pengembalian karena perubahan pikiran semata, biaya pengembalian stok sebesar 6.000 won dapat dikenakan, dan pelanggan bertanggung jawab atas biaya pengiriman pengembalian.',
    },
    'injxpokk': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'qqm63jv9': {
      'ko': '교환 및 반품은 고객센터 안내에 따라 사전 접수 후 개별적으로 진행됩니다.',
      'bn':
          'গ্রাহক কেন্দ্রের নির্দেশ অনুসারে পূর্ব আবেদনের পর বিনিময় এবং রিটার্ন পৃথকভাবে প্রক্রিয়া করা হয়।',
      'en':
          'Exchanges and returns are processed individually after prior application according to the customer center\'s instructions.',
      'id':
          'Penukaran dan pengembalian diproses secara individual setelah permohonan sebelumnya sesuai dengan petunjuk pusat layanan pelanggan.',
    },
    'xe7oiijm': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'f9q9r0ga': {
      'ko': '사전 접수 없이 임의로 반품하신 경우 교환 또는 환불 처리가 제한될 수 있습니다.',
      'bn':
          'যদি আপনি পূর্ব নোটিশ ছাড়াই কোনও জিনিস ফেরত দেন, তাহলে আপনার বিনিময় বা ফেরত দেওয়ার ক্ষমতা সীমিত হতে পারে।',
      'en':
          'If you return an item without prior notice, your ability to exchange or refund may be restricted.',
      'id':
          'Jika Anda mengembalikan barang tanpa pemberitahuan sebelumnya, kemampuan Anda untuk menukar atau meminta pengembalian dana mungkin akan dibatasi.',
    },
    'dulsec7q': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'cbuzej75': {
      'ko': '반품 주소 :',
      'bn': 'ফেরত ঠিকানা : ',
      'en': 'Return Address : ',
      'id': 'Alamat Retur',
    },
    'errnu7cr': {
      'ko': '인천 서구 원창동 394-35',
      'bn': '인천 서구 원창동 394-35',
      'en': '인천 서구 원창동 394-35',
      'id': '인천 서구 원창동 394-35',
    },
    'pfuqryiz': {
      'ko': '주문 취소 안내',
      'bn': 'অর্ডার বাতিলের বিজ্ঞপ্তি',
      'en': 'Order Cancellation Notice',
      'id': 'Pemberitahuan Pembatalan Pesanan',
    },
    'f6gsmnz6': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '5omfzwet': {
      'ko': '주문취소는 [주문 목록>주문내역]에서 직접 하실 수 있습니다.',
      'bn':
          'আপনি সরাসরি [অর্ডার তালিকা > অর্ডারের বিবরণ] থেকে আপনার অর্ডার বাতিল করতে পারেন।',
      'en':
          'You can cancel your order directly from [Order List > Order Details].',
      'id':
          'Anda dapat membatalkan pesanan Anda langsung dari [Daftar Pesanan > Detail Pesanan].',
    },
    'g2b2zsan': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '4vgtnmo3': {
      'ko':
          '주문 상태가 [배송중]인 경우 배송이 시작되어 주문 취소가 불가하며, 반품 접수를 통해 처리해야 합니다.\n(단, 상품에 따라 반품이 제한될 수 있습니다.)',
      'bn':
          'যদি আপনার অর্ডারের অবস্থা [ডেলিভারিতে] হয়, তাহলে শিপিং শুরু হয়ে গেছে এবং বাতিল করা সম্ভব নয়। আপনার অর্ডার প্রক্রিয়া করার জন্য আপনাকে একটি ফেরতের অনুরোধ জমা দিতে হবে। (তবে, পণ্যের উপর নির্ভর করে ফেরতের পরিমাণ সীমিত হতে পারে।)',
      'en':
          'If your order status is [In Transit], shipping has begun and cancellation is not possible. You must submit a return request to process your order. (However, returns may be restricted depending on the product.)',
      'id':
          'Jika status pesanan Anda [Dalam Pengiriman], pengiriman telah dimulai dan pembatalan tidak dimungkinkan. Anda harus mengirimkan permintaan pengembalian untuk memproses pesanan Anda. (Namun, pengembalian mungkin dibatasi tergantung pada produknya.)',
    },
    'bads6sw7': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'cf2m2t9i': {
      'ko': '주문 취소 및 반품 접수와 관련하여 도움이 필요하신 경우 고객센터로 문의해 주시기 바랍니다.',
      'bn':
          'অর্ডার বাতিল বা ফেরত দেওয়ার ক্ষেত্রে যদি আপনার সহায়তার প্রয়োজন হয়, তাহলে অনুগ্রহ করে আমাদের গ্রাহক পরিষেবা কেন্দ্রে যোগাযোগ করুন।',
      'en':
          'If you need assistance with order cancellation or return, please contact our customer service center.',
      'id':
          'Jika Anda memerlukan bantuan terkait pembatalan pesanan atau pengembalian, silakan hubungi pusat layanan pelanggan kami.',
    },
    'lkf20ftv': {
      'ko': '결제 승인 취소/환불 안내',
      'bn': 'পেমেন্ট বাতিল/রিফান্ড তথ্য',
      'en': 'Payment Cancellation/Refund Information',
      'id': 'Informasi Pembatalan Pembayaran/Pengembalian Dana',
    },
    'ogjjlbht': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'oq1ovk19': {
      'ko': '결제 승인 취소 시 결제 금액 기준으로 환불이 진행되며, 영업일 기준 약 3일 이내 결제사에 반영됩니다.',
      'bn':
          'যখন পেমেন্ট অনুমোদন বাতিল করা হয়, তখন পেমেন্টের পরিমাণের উপর ভিত্তি করে একটি রিফান্ড প্রক্রিয়া করা হবে এবং রিফান্ড প্রায় 3 কার্যদিবসের মধ্যে পেমেন্ট কোম্পানিতে প্রতিফলিত হবে।',
      'en':
          'When payment authorization is cancelled, a refund will be processed based on the payment amount, and the refund will be reflected in the payment company within approximately 3 business days.',
      'id':
          'Ketika otorisasi pembayaran dibatalkan, pengembalian dana akan diproses berdasarkan jumlah pembayaran, dan pengembalian dana akan tercermin di perusahaan pembayaran dalam waktu sekitar 3 hari kerja.',
    },
    'rwpgyrsq': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    '65seu8az': {
      'ko': '사용하신 적립금 및 쿠폰의 복원 여부는 각 혜택의 적용 조건에 따라 상이할 수 있습니다.',
      'bn':
          'আপনার ব্যবহৃত পয়েন্ট এবং কুপন পুনরুদ্ধার করতে পারবেন কিনা তা প্রতিটি সুবিধার আবেদনের শর্তের উপর নির্ভর করে পরিবর্তিত হতে পারে।',
      'en':
          'Whether or not you can restore your used points and coupons may vary depending on the application conditions of each benefit.',
      'id':
          'Apakah Anda dapat mengembalikan poin dan kupon yang telah digunakan atau tidak, mungkin berbeda-beda tergantung pada ketentuan penggunaan masing-masing manfaat.',
    },
    '9jlrkblu': {
      'ko': '-',
      'bn': '-',
      'en': '-',
      'id': '-',
    },
    'dbhavien': {
      'ko':
          '환불 처리 시점은 결제 수단 및 결제 대행사의 정책에 따라 달라질 수 있으며, 자세한 사항은 해당 결제사에 문의해 주시기 바랍니다.',
      'bn':
          'আপনার পেমেন্ট পদ্ধতি এবং পেমেন্ট প্রসেসরের নীতির উপর নির্ভর করে রিফান্ড প্রক্রিয়াকরণের সময় পরিবর্তিত হতে পারে। বিস্তারিত জানার জন্য অনুগ্রহ করে আপনার পেমেন্ট প্রসেসরের সাথে যোগাযোগ করুন।',
      'en':
          'Refund processing times may vary depending on your payment method and the payment processor\'s policies. Please contact your payment processor for details.',
      'id':
          'Waktu pemrosesan pengembalian dana dapat bervariasi tergantung pada metode pembayaran Anda dan kebijakan penyedia layanan pembayaran. Silakan hubungi penyedia layanan pembayaran Anda untuk detailnya.',
    },
    '8ztfxfik': {
      'ko': 'Home',
      'bn': 'হোম',
      'en': 'Home',
      'id': 'Rumah',
    },
  },
  // HalalRestaurantMap
  {
    '3zpjrap7': {
      'ko': '지역별 할랄 음식점',
      'bn': 'অঞ্চল অনুসারে হালাল রেস্তোরাঁ',
      'en': 'Halal Restaurants by Region',
      'id': 'Restoran Halal per Wilayah',
    },
    '65ks4y5c': {
      'ko': 'Home',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
  // AddHalalRestaurant
  {
    '6h8oq9ht': {
      'ko': '할랄 음식점 추가',
      'bn': 'হালাল রেস্টুরেন্ট যোগ করুন',
      'en': 'Add Halal Restaurant',
      'id': 'Tambah Restoran Halal',
    },
    'zu4kji2d': {
      'ko': '(',
      'bn': '(',
      'en': '(',
      'id': '(',
    },
    'rfa9x1xy': {
      'ko': ')',
      'bn': ')',
      'en': ')',
      'id': ')',
    },
    '0tudcz0z': {
      'ko': '복사',
      'bn': 'কপি করুন',
      'en': 'Copy',
      'id': 'Salin',
    },
    '7xgaicri': {
      'ko': '복사',
      'bn': 'কপি করুন',
      'en': 'Copy',
      'id': 'Salin',
    },
    'rosb9rcx': {
      'ko': '추가한 음식점 정보는 모든 사용자에게 공개되며,\n운영 정책에 따라 수정 또는 삭제될 수 있습니다.',
      'bn':
          'আপনি যে রেস্তোরাঁর তথ্য যোগ করবেন, তা সকল ব্যবহারকারীর জন্য দৃশ্যমান হবে এবং পরিচালন নীতিমালা অনুযায়ী সংশোধন বা মুছে ফেলা হতে পারে।',
      'en':
          'Restaurants you add will be visible to all users and may be modified or removed in accordance with our policies.',
      'id':
          'Restoran yang Anda tambahkan akan terlihat oleh semua pengguna dan dapat diubah atau dihapus sesuai dengan kebijakan operasional kami.',
    },
    'byl6eksf': {
      'ko': '할랄 음식점 추가하기',
      'bn': 'হালাল রেস্তোরাঁ যোগ করুন',
      'en': 'Add a Halal Restaurant',
      'id': 'Tambah Restoran Halal',
    },
    'hr8miu1e': {
      'ko': 'Home',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
  // HalalRestaurantSearch
  {
    '29lcc021': {
      'ko': '할랄 음식점 검색',
      'bn': 'হালাল রেস্তোরাঁ অনুসন্ধান',
      'en': 'Halal Restaurant Search',
      'id': 'Pencarian Restoran Halal',
    },
    'zo0s5ys7': {
      'ko': '할랄 음식점 이름을 입력해주세요!',
      'bn': 'হালাল রেস্টুরেন্টের নাম লিখুন',
      'en': 'Please enter the halal restaurant name',
      'id': 'Masukkan nama restoran halal',
    },
    'yttdmyv5': {
      'ko': '(',
      'bn': '',
      'en': '',
      'id': '',
    },
    'qgaxvwzd': {
      'ko': ')',
      'bn': '',
      'en': '',
      'id': '',
    },
    '7wez6k65': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    'psrzwez8': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    'odb39lw3': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    'jgpomjgu': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    'rn1p5x64': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    'd9enp1yj': {
      'ko': 'Home',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
  // HalalRestaurantList
  {
    '7qmja6n9': {
      'ko': '할랄 음식점 목록',
      'bn': 'হালাল রেস্টুরেন্ট তালিকা',
      'en': 'Halal Restaurant List',
      'id': 'Daftar Restoran Halal',
    },
    'x8sqamj7': {
      'ko': '지역별 음식점',
      'bn': 'এলাকা অনুযায়ী',
      'en': 'By Area',
      'id': 'Wilayah',
    },
    'ikm9q5s6': {
      'ko': 'Select...',
      'bn': 'Select...',
      'en': 'Select...',
      'id': 'Select...',
    },
    'r8nbz9fj': {
      'ko': 'Search...',
      'bn': '',
      'en': '',
      'id': '',
    },
    'tk9v58mn': {
      'ko': 'Option 1',
      'bn': '',
      'en': '',
      'id': '',
    },
    'pnuy3npd': {
      'ko': 'Option 3',
      'bn': '',
      'en': '',
      'id': '',
    },
    '30m2bzp6': {
      'ko': 'Search...',
      'bn': '',
      'en': '',
      'id': '',
    },
    'doeraqr3': {
      'ko': 'Option 1',
      'bn': '',
      'en': '',
      'id': '',
    },
    'eyyynfct': {
      'ko': 'Option 2',
      'bn': '',
      'en': '',
      'id': '',
    },
    'd1yfzz82': {
      'ko': 'Option 3',
      'bn': '',
      'en': '',
      'id': '',
    },
    'xuvo344f': {
      'ko': '(',
      'bn': '(',
      'en': '(',
      'id': '(',
    },
    'xsnfr8yb': {
      'ko': ')',
      'bn': ')',
      'en': ')',
      'id': ')',
    },
    '104clnl6': {
      'ko': '내 주변 음식점',
      'bn': 'কাছাকাছি',
      'en': 'Nearby',
      'id': 'Terdekat',
    },
    'u8j277gf': {
      'ko': '(',
      'bn': '',
      'en': '',
      'id': '',
    },
    'jqsyip6f': {
      'ko': ')',
      'bn': '',
      'en': '',
      'id': '',
    },
    'e8akxel9': {
      'ko': 'km',
      'bn': 'km',
      'en': 'km',
      'id': 'km',
    },
    '7umm32b0': {
      'ko': '홈',
      'bn': 'বাড়ি',
      'en': 'home',
      'id': 'rumah',
    },
    '53rh8y6n': {
      'ko': '검색',
      'bn': 'অনুসন্ধান',
      'en': 'search',
      'id': 'mencari',
    },
    '9eheu989': {
      'ko': '카테고리',
      'bn': 'বিভাগ',
      'en': 'Category',
      'id': 'Kategori',
    },
    '8br60qlz': {
      'ko': '마이',
      'bn': 'আমার',
      'en': 'my',
      'id': '-ku',
    },
    '85j8z4uu': {
      'ko': '장바구니',
      'bn': 'শপিং কার্ট',
      'en': 'Shopping Cart',
      'id': 'Keranjang Belanja',
    },
    'f0azhp29': {
      'ko': 'Home',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
  // HalalRestaurant
  {
    '0h3qg5fb': {
      'ko': '할랄 음식점',
      'bn': 'হালাল রেস্তোরাঁ',
      'en': 'Halal Restaurant',
      'id': 'Restoran Halal',
    },
    'khl3zbe8': {
      'ko': '(',
      'bn': '(',
      'en': '(',
      'id': '(',
    },
    'rlf4gsom': {
      'ko': ')',
      'bn': ')',
      'en': ')',
      'id': ')',
    },
    '9ittcrxt': {
      'ko': '복사',
      'bn': 'কপি করুন',
      'en': 'Copy',
      'id': 'Salin',
    },
    'c67064bj': {
      'ko': '영업 시간',
      'bn': 'ব্যবসায়িক সময়',
      'en': 'Opening Hours',
      'id': 'Jam Operasional',
    },
    '0qzj5ow4': {
      'ko': '복사',
      'bn': 'কপি করুন',
      'en': 'Copy',
      'id': 'Salin',
    },
    'lbt9d4b1': {
      'ko': 'Home',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
  // ProductOptions
  {
    '4mkhm1xa': {
      'ko': '장바구니 담기',
      'bn': 'একটি শপিং কার্টে রাখুন',
      'en': 'Put in a shopping cart',
      'id': 'Masukkan ke dalam keranjang belanja',
    },
  },
  // AddressSelectorComponent
  {
    '89lmmdag': {
      'ko': '배송지 선택',
      'bn': 'নির্বাচন',
      'en': 'Select',
      'id': 'Pilih',
    },
  },
  // GoCart
  {
    'vtdqrw4t': {
      'ko': '장바구니에 상품을 담았습니다!',
      'bn': 'কার্টে যোগ হয়েছে!',
      'en': 'Item added to cart!',
      'id': 'Ditambahkan ke keranjang!',
    },
    'u61ot27w': {
      'ko': '장바구니 가기',
      'bn': 'কার্টে যান',
      'en': 'Go to Cart',
      'id': 'Ke Keranjang',
    },
    '6djckzk8': {
      'ko': '이런 추천 상품은 어떠세요?',
      'bn': 'এই প্রস্তাবিত পণ্যগুলি কেমন হবে?',
      'en': 'How about these recommended products?',
      'id': 'Bagaimana dengan produk-produk yang direkomendasikan ini?',
    },
  },
  // productInformation
  {
    'k82d8t3b': {
      'ko': '제품명',
      'bn': 'পণ্যের নাম',
      'en': 'Product name',
      'id': 'Nama Produk',
    },
    'dddcg2ru': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'b3irkb58': {
      'ko': '식품의 유형',
      'bn': 'খাবারের প্রকারভেদ',
      'en': 'Types of food',
      'id': 'Jenis makanan',
    },
    'sgqo1ij3': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'vnoiupyo': {
      'ko': '생산자 및 소재지',
      'bn': 'প্রযোজক এবং অবস্থান',
      'en': 'Producer and location',
      'id': 'Produser dan lokasi',
    },
    'ea1n4zrd': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'is14rzl7': {
      'ko': '제조연월일, 소비기한 또는 품질유지기한',
      'bn':
          'উৎপাদনের তারিখ, মেয়াদ শেষ হওয়ার তারিখ, অথবা মান রক্ষণাবেক্ষণের সময়কাল',
      'en':
          'Date of manufacture, expiration date, or quality maintenance period',
      'id':
          'Tanggal pembuatan, tanggal kedaluwarsa, atau periode pemeliharaan kualitas.',
    },
    'quc5mne7': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    '41bhoziw': {
      'ko': '포장단위별 내용물의 용량(중량), 수량',
      'bn': 'প্রতি প্যাকেজিং ইউনিটে ধারণক্ষমতা (ওজন) এবং সামগ্রীর পরিমাণ',
      'en': 'Capacity (weight) and quantity of contents per packaging unit',
      'id': 'Kapasitas (berat) dan jumlah isi per unit kemasan',
    },
    'a045rwgi': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    '8698ms35': {
      'ko': '원재료명 및 함량',
      'bn': 'কাঁচামালের নাম এবং বিষয়বস্তু',
      'en': 'Raw material name and content',
      'id': 'Nama dan kandungan bahan baku',
    },
    'tfl0dre5': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'suq7nggy': {
      'ko': '영양성분',
      'bn': 'পুষ্টি সংক্রান্ত তথ্য',
      'en': 'Nutritional information',
      'id': 'Informasi nutrisi',
    },
    'wmcnfni8': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'kewizvq5': {
      'ko': '유전자변형식품에 해당하는 경우의 표시',
      'bn': 'জিনগতভাবে পরিবর্তিত খাবারের ইঙ্গিত',
      'en': 'Indication of genetically modified foods',
      'id': 'Indikasi makanan hasil rekayasa genetika',
    },
    '8oeyqkyo': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    '1y9srgyw': {
      'ko': '소비자안전을 위한 주의사항',
      'bn': 'ভোক্তা সুরক্ষার জন্য সতর্কতা',
      'en': 'Precautions for Consumer Safety',
      'id': 'Tindakan Pencegahan untuk Keselamatan Konsumen',
    },
    'td0vp4mu': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    '986kynjc': {
      'ko': '수입식품 문구',
      'bn': 'আমদানি করা খাবারের স্টেশনারি',
      'en': 'Imported food stationery',
      'id': 'Alat tulis makanan impor',
    },
    'vu5id6u3': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
    'x2g6dcup': {
      'ko': '소비자상담관련\n전화번호',
      'bn': 'গ্রাহক পরামর্শ\nফোন নম্বর',
      'en': 'Consumer Counseling\nPhone Number',
      'id': 'Konseling Konsumen\nNomor Telepon',
    },
    'aej4cb6g': {
      'ko': '상품 상세페이지 참조',
      'bn': 'পণ্যের বিবরণ পৃষ্ঠাটি দেখুন।',
      'en': 'Refer to the product details page',
      'id': 'Silakan lihat halaman detail produk.',
    },
  },
  // installApp
  {
    'd7y5t09q': {
      'ko': 'Google Play',
      'bn': 'গুগল প্লে',
      'en': 'Google Play',
      'id': 'Google Play',
    },
    'nwnvg9p7': {
      'ko': '앱 다운로드 하기',
      'bn': 'অ্যাপটি ডাউনলোড করুন',
      'en': 'Download the app',
      'id': 'Unduh aplikasinya',
    },
    'xfmundku': {
      'ko': 'App Store',
      'bn': 'অ্যাপ স্টোর',
      'en': 'App Store',
      'id': 'App Store',
    },
    'ffw1mccn': {
      'ko': '앱 다운로드 하기',
      'bn': 'অ্যাপটি ডাউনলোড করুন',
      'en': 'Download the app',
      'id': 'Unduh aplikasinya',
    },
  },
  // Miscellaneous
  {
    'esg01bid': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '50nmzzt6': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'zzhi7r7v': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'cd1ubl5n': {
      'ko': '알람 허용',
      'bn': '',
      'en': '',
      'id': '',
    },
    'quzciu9c': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'j2yepfsj': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '2hrhla97': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'ved41wbh': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'bqimxq0a': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '7bwkbodk': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'rur3zto3': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'yyuclu9w': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '61dsdln9': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'gsv4ch30': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'efyri6oh': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'sl3v8pa7': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '6p70rw29': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '4upe1gvf': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'v7ofpifn': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '0zj64rin': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'aa207i71': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'e3zvx8yj': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '3285bkox': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'x97bquvg': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'h85miuv9': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    '4pvbsdvx': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'x8vczve4': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'lm0baelf': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
    'elpgr9f9': {
      'ko': '',
      'bn': '',
      'en': '',
      'id': '',
    },
  },
].reduce((a, b) => a..addAll(b));
