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

  List<DocumentReference> _favorites = [];
  List<DocumentReference> get favorites => _favorites;
  set favorites(List<DocumentReference> value) {
    _favorites = value;
  }

  void addToFavorites(DocumentReference value) {
    favorites.add(value);
  }

  void removeFromFavorites(DocumentReference value) {
    favorites.remove(value);
  }

  void removeAtIndexFromFavorites(int index) {
    favorites.removeAt(index);
  }

  void updateFavoritesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favorites[index] = updateFn(_favorites[index]);
  }

  void insertAtIndexInFavorites(int index, DocumentReference value) {
    favorites.insert(index, value);
  }

  String _tkey = '';
  String get tkey => _tkey;
  set tkey(String value) {
    _tkey = value;
  }
}
