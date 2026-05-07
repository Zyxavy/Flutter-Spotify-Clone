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
          padding: const EdgeInsets.all(12),
          children: [
            const _TopChips(),
            const SizedBox(height: 12),
            const _QuickGrid(),
            const SizedBox(height: 18),
            Text('Jump back in', style: AppTextStyles.titleM),
            const SizedBox(height: 12),
            const _HorizontalCards(),
            const SizedBox(height: 18),
            Text('More like Bruno Mars', style: AppTextStyles.titleM),
            const SizedBox(height: 12),
            const _HorizontalCards(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _TopChips extends StatelessWidget {
  const _TopChips();

  @override
  Widget build(BuildContext context) {
    Widget chip(String text, {bool active = false}) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.chipActive : AppColors.chipIdle,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    return Row(
      children: [
        const CircleAvatar(radius: 16, backgroundColor: Colors.deepOrange, child: Text('K')),
        const SizedBox(width: 10),
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
      'Daily Mix 1',
      'Drake Radio',
      'R&B Classics 90s',
      'This Is Bruno Mars',
      'Liked Songs',
      'LANY',
    ];

    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3.1,
      ),
      itemBuilder: (_, i) => Container(
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(width: 48, color: Colors.grey.shade700),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                items[i],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyM,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorizontalCards extends StatelessWidget {
  const _HorizontalCards();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) => SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: i.isEven ? const Color(0xFF98E8D1) : Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 8),
              Text('Playlist', style: AppTextStyles.bodyS),
              const SizedBox(height: 2),
              Text('Mock title $i', style: AppTextStyles.titleS, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}