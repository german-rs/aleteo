import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControlsWidget extends StatelessWidget {
  final AudioPlayer player;
  final Duration currentPosition;
  final Duration totalDuration;
  final Function playPause;

  const AudioControlsWidget({
    super.key,
    required this.player,
    required this.currentPosition,
    required this.totalDuration,
    required this.playPause,
  });

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return "$minutes:${seconds.toString().padLeft(2, "0")}";
  }

  double _calculatePercentage() {
    if (totalDuration.inMilliseconds == 0) {
      return 0.0;
    }
    return ((currentPosition.inMilliseconds / totalDuration.inMilliseconds) *
            100) /
        100;
  }

  @override
  Widget build(BuildContext context) {
    double percentage =
        MediaQuery.of(context).size.width * _calculatePercentage();

    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 10,
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: Colors.white,
                  ),
                  Container(
                    width: percentage,
                    height: 4,
                    color: const Color(0xFF643CEB),
                  ),
                  Positioned(
                    left: percentage,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFF643CEB),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(currentPosition),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _formatDuration(totalDuration),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.shuffle,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.skip_previous_rounded,
              color: Colors.white,
              size: 28,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => playPause(),
                icon: Icon(
                  player.playing ? Icons.pause : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 28,
            ),
            const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 28,
            ),
          ],
        ),
      ],
    );
  }
}
