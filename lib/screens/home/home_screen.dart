import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../data/mock_data.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/genre_chip.dart';
import '../../widgets/mix_card.dart';
import '../../widgets/section_header.dart';
import '../../widgets/song_tile.dart';
import '../../widgets/home_side_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _showSideNav() {
    showGeneralDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'home-side-nav',
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 220),
      pageBuilder: (_, __, ___) => HomeSideNav(
        onClose: () => Navigator.of(context).maybePop(),
      ),
      transitionBuilder: (_, animation, __, child) {
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(-0.06, 0), end: Offset.zero).animate(curved),
          child: FadeTransition(opacity: curved, child: child),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 6, 14, 8),
          children: [
            _TopChips(onAvatarTap: _showSideNav),
            SizedBox(height: 14),
            _QuickGrid(),
            SizedBox(height: 20),
            SectionHeader('Jump back in'),
            SizedBox(height: 12),
            _HorizontalCards(),
            SizedBox(height: 20),
            SectionHeader('More like Bruno Mars'),
            SizedBox(height: 12),
            _HorizontalCards(secondRow: true),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _TopChips extends StatelessWidget {
  final VoidCallback onAvatarTap;

  const _TopChips({required this.onAvatarTap});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onAvatarTap,
          borderRadius: BorderRadius.circular(18),
          child: const CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xFFFF6B2A),
            child: Text('K', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
          ),

        ),
        for (final genre in topGenres) ...[
          const SizedBox(width: 8),
          GenreChip(genre: genre),
        ],

      ],
    );
  }
}

class _QuickGrid extends StatelessWidget {
  const _QuickGrid();

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      itemCount: quickSongs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
        childAspectRatio: 3.15,
      ),
      itemBuilder: (_, i) => SongTile(song: quickSongs[i]),
    );
  }
}

class _HorizontalCards extends StatelessWidget {
  final bool secondRow;
  const _HorizontalCards({this.secondRow = false});


  @override
  Widget build(BuildContext context) {
    final mixes = secondRow ? similarToBrunoMixes : jumpBackInMixes;

    
    return SizedBox(
      height: 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: mixes.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, i) => MixCard(
          mix: mixes[i],
          compactTitle: secondRow,

        ),
      ),
    );
  }
}