import 'package:flutter/material.dart';

class Mix {
  const Mix({
    required this.title,
    required this.description,
    required this.coverColor,
    this.isRadio = true,
  });

  final String title;
  final String description;
  final Color coverColor;
  final bool isRadio;
}
