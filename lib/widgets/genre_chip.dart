import 'package:flutter/material.dart';

import '../data/models/genre.dart';
import '../theme/app_colors.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({super.key, required this.genre});

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: genre.isActive ? AppColors.chipActive : AppColors.chipIdle,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Text(
        genre.label,
        style: TextStyle(
          color: genre.isActive ? Colors.black : Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
