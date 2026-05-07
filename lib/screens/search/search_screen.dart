import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 20),
          children: const [
            _HeaderRow(),
            SizedBox(height: 18),
            _SearchField(),
            SizedBox(height: 26),
            _SectionTitle('Start browsing'),
            SizedBox(height: 12),
            _StartBrowsingTiles(),
            SizedBox(height: 24),
            _SectionTitle('Discover something new'),
            SizedBox(height: 12),
            _DiscoverRow(),
            SizedBox(height: 24),
            _SectionTitle('Browse all'),
            SizedBox(height: 12),
            _BrowseAllScaffold(),
          ],
        ),
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 17,
          backgroundColor: Color(0xFFFF6B2A),
          child: Text('K', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
        ),
        const SizedBox(width: 12),
        Text('Search', style: AppTextStyles.titleM),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black87, size: 23),
          const SizedBox(width: 10),
          Text(
            'What do you want to listen to?',
            style: AppTextStyles.bodyM.copyWith(color: Colors.black87, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.titleS.copyWith(fontWeight: FontWeight.w800));
  }
}

class _StartBrowsingTiles extends StatelessWidget {
  const _StartBrowsingTiles();

  static const _tiles = [
    ('Music', Color(0xFFD84F2E)),
    ('Podcasts', Color(0xFF005C57)),
    ('Live Events', Color(0xFF7A2CF1)),
    ('Made For You', Color(0xFF2462EA)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _tiles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.65,
      ),
      itemBuilder: (_, index) {
        final (title, color) = _tiles[index];
        return Container(
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: AppTextStyles.titleS.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      },
    );
  }
}

class _DiscoverRow extends StatelessWidget {
  const _DiscoverRow();

  static const _cards = [
    ('Fresh Finds', 'Weekly music picks', Color(0xFF0F4C81)),
    ('New Podcasts', 'Hot episodes this week', Color(0xFF733F0A)),
    ('Trending Now', 'Songs everyone plays', Color(0xFF1F7A3D)),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _cards.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final (title, subtitle, color) = _cards[index];
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(title, style: AppTextStyles.bodyM.copyWith(fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                  child: Text(subtitle, style: AppTextStyles.bodyS),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BrowseAllScaffold extends StatelessWidget {
  const _BrowseAllScaffold();

  static const _items = [
    ('Pop', Color(0xFF9A2F53)),
    ('Hip-Hop', Color(0xFF2D669C)),
    ('Workout', Color(0xFF1E8247)),
    ('Chill', Color(0xFF7143BB)),
    ('Party', Color(0xFFB04A22)),
    ('Focus', Color(0xFF565656)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.95,
      ),
      itemBuilder: (_, index) {
        final (title, color) = _items[index];
        return Container(
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: AppTextStyles.titleS.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      },
    );

  }
}