import 'package:flutter/material.dart';

import '../data/models/mix.dart';
import '../theme/app_text_styles.dart';

class MixCard extends StatelessWidget {
  const MixCard({super.key, required this.mix, this.compactTitle = false});

  final Mix mix;
  final bool compactTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: mix.coverColor,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(radius: 6, backgroundColor: Colors.black54),
                ),
                if (mix.isRadio)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Text(
                      'RADIO',
                      style: AppTextStyles.bodyS.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Text(
                    mix.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.titleM.copyWith(
                      color: Colors.black,
                      fontSize: compactTitle ? 44 * 0.52 : 44 * 0.56,
                      height: 0.95,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text('Playlist', style: AppTextStyles.bodyS.copyWith(fontSize: 28 * 0.48)),
          const SizedBox(height: 3),
          Text(
            mix.description,
            style: AppTextStyles.bodyS.copyWith(fontSize: 13),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
