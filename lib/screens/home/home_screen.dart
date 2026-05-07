import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 6, 14, 8),
          children: const [
            _TopChips(),
            SizedBox(height: 14),
            _QuickGrid(),
            SizedBox(height: 20),
            _SectionTitle('Jump back in'),
            SizedBox(height: 12),
            _HorizontalCards(),
            SizedBox(height: 20),
            _SectionTitle('More like Bruno Mars'),
            SizedBox(height: 12),
            _HorizontalCards(secondRow: true),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.titleM.copyWith(fontSize: 40 * 0.62, height: 1.0),
    );
  }
}


class _TopChips extends StatelessWidget {
  const _TopChips();

  @override
  Widget build(BuildContext context) {
    Widget chip(String text, {bool active = false}) {
      return Container(
       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.chipActive : AppColors.chipIdle,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      );
    }

    return Row(
      children: [
        const CircleAvatar(
          radius: 17,
          backgroundColor: Color(0xFFFF6B2A),
          child: Text('K', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
        ),
        chip('All', active: true),
        const SizedBox(width: 8),
        chip('Music'),
        const SizedBox(width: 8),
        chip('Podcasts'),
      ],
    );
  }
}

class _QuickGrid extends StatelessWidget {
  const _QuickGrid();

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Daily Mix 1', Color(0xFF1B5E20)),
      ('Drake Radio', Color(0xFF7B1FA2)),
      ('R&B Classics 90s & 2000s - Best Old School...', Color(0xFF8D6E63)),
      ('This Is Bruno Mars', Color(0xFFE65100)),
      ('Liked Songs', Color(0xFF5E35B1)),
      ('LANY', Color(0xFF455A64)),
      ('Daniel Caesar Radio', Color(0xFF26A69A)),
      ('Get Low', Color(0xFF42A5F5)),

    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        childAspectRatio: 3.15,

      ),
      itemBuilder: (_, i) => Container(
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
                  colors: [items[i].$2, items[i].$2.withValues(alpha: 0.5)],
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
                items[i].$1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            if (i == 3)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(Icons.more_horiz, size: 18, color: AppColors.spotifyGreen),
              ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCards extends StatelessWidget {
  final bool secondRow;
  const _HorizontalCards({this.secondRow = false});


  @override
  Widget build(BuildContext context) {
    final colors = secondRow
        ? [const Color(0xFFA5E8CD), const Color(0xFF9AC5DC), const Color(0xFF2B0E24)]
        : [const Color(0xFF7B4A1A), const Color(0xFF8CEED3), const Color(0xFFA5F1D5)];

    final titles = secondRow
        ? ['Bruno Mars', 'Sing-along:90\'s to Now', 'Top Viral\nThrowbacks']
        : ['OPM Mix', 'Panic! At The Disco', 'Taylor Swift'];

    
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, i) => SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colors[i],
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(radius: 6, backgroundColor: Colors.black54),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Text('RADIO', style: AppTextStyles.bodyS.copyWith(fontWeight: FontWeight.w800, color: Colors.black)),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Text(
                        titles[i],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.titleM.copyWith(
                          color: Colors.black,
                          fontSize: secondRow ? 44 * 0.52 : 44 * 0.56,
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
                i == 0 ? 'Khel Pangilinan, Skusta Clee, Ben&Ben and more' : 'My Chemical Romance, Panic! At The Disco, Taylor Swift',
                style: AppTextStyles.bodyS.copyWith(fontSize: 13),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),
      ),
    );
  }
}