import 'package:flutter/material.dart';

class AdoptBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AdoptBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: currentIndex == 0 ? const Color(0xFF91C9B9) : Colors.grey,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_rounded,
            color: currentIndex == 1 ? const Color(0xFF91C9B9) : Colors.grey,
          ),
          label: "Favoritos",
        ),
      ],
    );
  }
}
