import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 3),
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: AppColors.textPrimary,
                  shape: BoxShape.circle,
                ),

                child: const Icon(  //CHANGE TO SPOTIFY LOGO
                  Icons.music_note,
                  color: AppColors.bg,
                  size: 40,
                ),

              ),
              const SizedBox(height: 28),
              Text(
                'Millions of songs.\nFree on Spotify.',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingXL.copyWith(height: 1.2),
              ),
              const SizedBox(height: 44),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => context.go('/home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.spotifyGreen,
                    foregroundColor: AppColors.bg,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    textStyle: AppTextStyles.titleS.copyWith(fontWeight: FontWeight.w700),
                  ),
                  child: const Text('Sign up free'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => context.go('/home'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textPrimary,
                    side: BorderSide(color: AppColors.textPrimary.withValues(alpha: 0.54)),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    textStyle: AppTextStyles.titleS.copyWith(fontWeight: FontWeight.w700),
                  ),
                  child: const Text('Log in'),
                ),
              ),
              const Spacer(flex: 2),
              Text(
                'By continuing, you agree to Spotify\'s terms and privacy policy.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyS.copyWith(height: 1.4),
              ),
              const SizedBox(height: 16),
            ],
          ),

        ),
      ),
    );
  }
}