import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Shoe {
  Shoe({
    required this.brand,
    this.description,
    required this.image,
    this.lastPrice,
    required this.name,
    required this.price,
  })  : createdAt = DateTime.now(),
        id = uuid.v4();
  final String brand;
  final DateTime createdAt;
  final String? description;
  final String id;
  final String image;
  final double? lastPrice;
  final String name;
  final double price;
}
