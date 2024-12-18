import 'package:flutter/material.dart';

class AudioLyricsWidget extends StatefulWidget {
  const AudioLyricsWidget({super.key});

  @override
  State<AudioLyricsWidget> createState() => _AudioLyricsWidgetState();
}

class _AudioLyricsWidgetState extends State<AudioLyricsWidget> {
  double lyricsHeight = 160;
  bool isExpandedLyrics = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: lyricsHeight,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF302F42),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lyrics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isExpandedLyrics = !isExpandedLyrics;
                    lyricsHeight = isExpandedLyrics ? 650 : 160;
                  });
                },
                icon: Icon(
                  isExpandedLyrics
                      ? Icons.close_fullscreen_outlined
                      : Icons.open_in_full_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Midnight",
            style: TextStyle(color: Colors.grey[400]),
          ),
          const Text(
            "You come and pick me up, no headlights",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Long drive",
            style: TextStyle(color: Colors.grey[400]),
          ),
          Text(
            "You come and pick me up, no headlights",
            style: TextStyle(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
