import 'package:flutter/painting.dart';

enum Important { low, medium, high }

class GroceryItem {
  final String id;
  final String name;
  final Important important;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;

  GroceryItem({
    required this.id,
    required this.name,
    required this.important,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
  });

  GroceryItem copyWith({
    String? id,
    String? name,
    Important? important,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        important: important ?? this.important,
        color: color ?? this.color,
        quantity: quantity ?? this.quantity,
        date: date ?? this.date,
        isComplete: isComplete ?? this.isComplete);
  }
}
