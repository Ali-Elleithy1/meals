import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Container(
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(meal.imageUrl),
        ),
      ),
    );
  }
}
