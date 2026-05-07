import 'package:flutter/material.dart';

class Song {
  const Song({
    required this.title,
    required this.accent,
    this.subtitle,
    this.isMoreHighlighted = false,
  });

  final String title;
  final String? subtitle;
  final Color accent;
  final bool isMoreHighlighted;
}
