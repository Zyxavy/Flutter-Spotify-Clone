import 'package:flutter/material.dart';

import '../data/models/artist.dart';
import '../theme/app_text_styles.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key, required this.artist});

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(artist.name, style: AppTextStyles.titleS),
        const SizedBox(height: 2),
        Text(artist.description, style: AppTextStyles.bodyS),
      ],
    );
  }
}
