import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toogleFavoriteStatus() async {
    final odlStatus = isFavorite;
    _setFavValue(!isFavorite);

    final url =
        'https://flutter-formation-e862e.firebaseio.com/products/${id}.json';
    try {
      final response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
      if (response.statusCode >= 400) {
        _setFavValue(odlStatus);
      }
    } catch (e) {
      _setFavValue(odlStatus);
    }
  }

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }
}
