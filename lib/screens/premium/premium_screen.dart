import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      color: AppColors.bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          children: const [
            _HeroVisual(),
            SizedBox(height: 24),
            _PremiumHeading(),
            SizedBox(height: 18),
            _GetStartedButton(),
            SizedBox(height: 22),
            _WhyJoinCard(),
          ],
        ),
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3A1C71), Color(0xFF1D2B64), Color(0xFF0F6A46)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -22,
            right: -18,
            child: _GlowBubble(size: 120, color: Colors.white.withValues(alpha: 0.12)),
          ),
          Positioned(
            bottom: 18,
            left: 18,
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.16),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.workspace_premium, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 10),
                Text(
                  'Ad-free listening',
                  style: AppTextStyles.titleS.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowBubble extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowBubble({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _PremiumHeading extends StatelessWidget {
  const _PremiumHeading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Premium',
          style: AppTextStyles.titleS.copyWith(
            color: AppColors.spotifyGreen,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Listen without limits.\nDownload, skip, and go ad-free.',
          style: AppTextStyles.headingL.copyWith(height: 1.16),
        ),
      ],
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.spotifyGreen,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          textStyle: AppTextStyles.titleS.copyWith(color: Colors.black),
        ),
        onPressed: () {},
        child: const Text('Get started'),
      ),
    );
  }
}

class _WhyJoinCard extends StatelessWidget {
  const _WhyJoinCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Why join Premium?', style: AppTextStyles.titleS),
          SizedBox(height: 14),
          _PremiumBullet(icon: Icons.block, text: 'Ad-free music listening'),
          SizedBox(height: 12),
          _PremiumBullet(icon: Icons.download_for_offline_rounded, text: 'Download to listen offline'),
          SizedBox(height: 12),
          _PremiumBullet(icon: Icons.skip_next_rounded, text: 'Unlimited skips, whenever you want'),
        ],
      ),
    );
  }
}

class _PremiumBullet extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PremiumBullet({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.spotifyGreen),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: AppTextStyles.bodyM)),
      ],
    );

  }
}