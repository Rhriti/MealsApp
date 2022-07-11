import 'package:flutter/widgets.dart';

class Category {
  final id;
  final title;
  final color;
  final AssetImage image;

  const Category({required this.id,required this.image, this.title, this.color,});
}
