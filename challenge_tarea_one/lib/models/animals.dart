import 'package:flutter/material.dart';

class ImageAnimals{
  ImageAnimals(
    this.image,
    this.color,
  );
  final String image;
  final Color color;
}

class Animals{
  Animals(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.listImage,
    this.url,
  );
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageAnimals> listImage;
  final String url;
}