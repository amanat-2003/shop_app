import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  Future<void> toggleFavouriteStatus() async {
    final url = Uri.parse(
        'https://flutter-app-6ab90-default-rtdb.firebaseio.com/products/$id.json');
    await http.patch(url, body: json.encode({
      'isFavourite':!isFavourite
    }));
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
