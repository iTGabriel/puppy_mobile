import 'package:flutter/foundation.dart';

class Petshop with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final List<Map<String, double>> services;
  final List<String> photografies;
  final String imageUrl;
  bool isFavorite;

  Petshop(
      {this.id,
      @required this.title,
      @required this.description,
      @required this.services,
      this.photografies,
      @required this.imageUrl,
      this.isFavorite = false});
}
