import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _selectedCategory = '육류';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  /// 장바구니
  DocumentReference? _cartItems = FirebaseFirestore.instance.doc('/cart/...');
  DocumentReference? get cartItems => _cartItems;
  set cartItems(DocumentReference? value) {
    _cartItems = value;
  }

  /// 카테고리
  List<String> _categories = [];
  List<String> get categories => _categories;
  set categories(List<String> value) {
    _categories = value;
  }

  void addToCategories(String value) {
    categories.add(value);
  }

  void removeFromCategories(String value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    categories.insert(index, value);
  }

  /// 카테고리 선택값 저장
  String _category = '';
  String get category => _category;
  set category(String value) {
    _category = value;
  }

  /// 상품명 저장
  String _productName = '';
  String get productName => _productName;
  set productName(String value) {
    _productName = value;
  }

  /// 브랜드명 저장
  String _brandName = '';
  String get brandName => _brandName;
  set brandName(String value) {
    _brandName = value;
  }

  /// 대표 이미지 URL 저장
  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  /// 할랄 인증 파일 URL 저장
  String _halalCertUrl = '';
  String get halalCertUrl => _halalCertUrl;
  set halalCertUrl(String value) {
    _halalCertUrl = value;
  }

  /// 상품 설명 저장
  String _description = '';
  String get description => _description;
  set description(String value) {
    _description = value;
  }

  /// 상품 설명 이미지 리스트
  List<String> _descriptionImageUrls = [];
  List<String> get descriptionImageUrls => _descriptionImageUrls;
  set descriptionImageUrls(List<String> value) {
    _descriptionImageUrls = value;
  }

  void addToDescriptionImageUrls(String value) {
    descriptionImageUrls.add(value);
  }

  void removeFromDescriptionImageUrls(String value) {
    descriptionImageUrls.remove(value);
  }

  void removeAtIndexFromDescriptionImageUrls(int index) {
    descriptionImageUrls.removeAt(index);
  }

  void updateDescriptionImageUrlsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    descriptionImageUrls[index] = updateFn(_descriptionImageUrls[index]);
  }

  void insertAtIndexInDescriptionImageUrls(int index, String value) {
    descriptionImageUrls.insert(index, value);
  }

  /// 생성 시간
  int _createdAt = 0;
  int get createdAt => _createdAt;
  set createdAt(int value) {
    _createdAt = value;
  }

  /// 재고 수량 (숫자로 변환해서 저장)
  int _stock = 0;
  int get stock => _stock;
  set stock(int value) {
    _stock = value;
  }

  /// 가격 (숫자로 변환해서 저장)
  double _price = 0.0;
  double get price => _price;
  set price(double value) {
    _price = value;
  }

  /// 자동 계산된 할인된 가격
  double _discountedPrice = 0.0;
  double get discountedPrice => _discountedPrice;
  set discountedPrice(double value) {
    _discountedPrice = value;
  }

  /// 할인율 (숫자로 변환해서 저장)
  double _discount = 0.0;
  double get discount => _discount;
  set discount(double value) {
    _discount = value;
  }
}
