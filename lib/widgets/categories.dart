import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String category;

  const Categories({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: .4, color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(category, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
