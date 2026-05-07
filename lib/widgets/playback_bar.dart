import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PlaybackBar extends StatelessWidget {
  const PlaybackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.playbackBar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.music_note, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Talking to the Moon • Bruno Mars',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.devices, color: Colors.white),
          SizedBox(width: 8),
          Icon(Icons.play_arrow, color: Colors.white),
        ],
      ),
    );
  }
}