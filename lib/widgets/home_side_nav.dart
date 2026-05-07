import 'package:flutter/material.dart';

class HomeSideNav extends StatelessWidget {
  final VoidCallback? onClose;

  const HomeSideNav({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 312,
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF181818),
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.45),
                  blurRadius: 20,
                  offset: const Offset(6, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 12, 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFFFF6B2A),
                        child: Text(
                          'K',
                          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Karthik S',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'View profile',
                              style: TextStyle(color: Color(0xFFA7A7A7), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: onClose,
                        splashRadius: 20,
                        icon: const Icon(Icons.close, color: Color(0xFFB3B3B3), size: 20),
                      ),
                    ],
                  ),
                ),
        
                const Divider(color: Color(0xFF2A2A2A), height: 1),
                const SizedBox(height: 8),
                const _MenuItem(label: 'Add account'),
                const _MenuItem(label: 'Listening stats'),
                const _MenuItem(label: 'Recents'),
                const _MenuItem(label: 'Your Updates'),
                const _MenuItem(label: 'Settings and privacy'),
                const SizedBox(height: 6),
                const Divider(color: Color(0xFF2A2A2A), height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Messages',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text('New message'),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String label;

  const _MenuItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
