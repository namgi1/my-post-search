// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ⚠️ web 패키지를 직접 import하지 않음 (iOS 빌드 깨짐)
// Web 환경에서만 런타임 import하도록 함수로 처리.
dynamic getWebDocument() {
  if (!kIsWeb) return null;

  try {
    // 웹 환경에서만 web 패키지 불러오기 (반드시 이 방식)
    final webLib = Function.apply(
      (Object? lib) => lib,
      [],
      {
        #lib: null,
      },
    );

    // ignore: avoid_dynamic_calls
    final web = (webLib as dynamic).call();
    return web.document;
  } catch (_) {
    return null;
  }
}

Future<void> insertProductSchema(String productID) async {
  try {
    final document = getWebDocument();

    if (!kIsWeb || document == null) {
      print("⚠️ Web 전용 기능입니다. 모바일에서는 실행 안 함.");
      return;
    }

    final firestore = FirebaseFirestore.instance;

    // 1️⃣ 상품 데이터 가져오기
    final doc = await firestore.collection('products').doc(productID).get();
    if (!doc.exists) return;
    final data = doc.data()!;

    // 2️⃣ 리뷰 데이터 가져오기
    final reviewsSnapshot = await firestore
        .collection('products')
        .doc(productID)
        .collection('reviews')
        .get();

    final List<Map<String, dynamic>> reviews = reviewsSnapshot.docs.map((r) {
      final d = r.data();
      return {
        "@type": "Review",
        "author": {"@type": "Person", "name": d['userName'] ?? "Anonymous"},
        "datePublished": (d['createdAt'] != null)
            ? (d['createdAt'] as Timestamp).toDate().toIso8601String()
            : null,
        "reviewBody": d['comment'] ?? "",
        "reviewRating": {
          "@type": "Rating",
          "ratingValue": d['rating']?.toString() ?? "0",
          "bestRating": "5"
        }
      };
    }).toList();

    // 3️⃣ 이미지
    final imageUrl = data['Main_image'] ??
        ((data['description_image'] is List &&
                data['description_image'].isNotEmpty)
            ? data['description_image'][0]
            : '');

    // 4️⃣ 스키마 생성
    final schema = {
      "@context": "https://schema.org",
      "@type": "Product",
      "name": data['productName'],
      "image": [imageUrl],
      "description": data['description'],
      "sku": data['productID'],
      "brand": {"@type": "Brand", "name": data['brandName']},
      "offers": {
        "@type": "Offer",
        "priceCurrency": "KRW",
        "price": data['price'].toString(),
        "priceValidUntil":
            DateTime.now().add(const Duration(days: 365)).toIso8601String(),
        "availability": data['stock'] > 0
            ? "https://schema.org/InStock"
            : "https://schema.org/OutOfStock",
        "url":
            "https://myhallie.com/ProductDetail?productRef=${data['productID']}"
      },
      "aggregateRating": {
        "@type": "AggregateRating",
        "ratingValue": data['avgRating']?.toString() ?? "0",
        "reviewCount": data['reviewCount']?.toString() ?? "0",
      },
      if (reviews.isNotEmpty) "review": reviews,
      "category": "${data['MainCategory']} > ${data['SubCategory']}"
    };

    // ⛓️ Script element 생성 (런타임 Web API 접근)
    final script = document.createElement("script");
    script.setAttribute("type", "application/ld+json");
    script.text = jsonEncode(schema);

    document.head!.append(script);

    print("✅ Schema inserted successfully with ${reviews.length} reviews!");
  } catch (e) {
    print("❌ Error inserting schema: $e");
  }
}
