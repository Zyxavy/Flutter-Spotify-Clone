import 'package:flutter/material.dart';

import '../data/models/song.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key, required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [song.accent, song.accent.withValues(alpha: 0.5)],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              song.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyM.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          if (song.isMoreHighlighted)
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.more_horiz, size: 18, color: AppColors.spotifyGreen),
            ),
        ],
      ),
    );
  }
}
