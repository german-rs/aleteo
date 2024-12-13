import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

class ReproductorMusica extends StatefulWidget {
  const ReproductorMusica({super.key});

  @override
  State<ReproductorMusica> createState() => _ReproductorMusicaState();
}

class _ReproductorMusicaState extends State<ReproductorMusica> {
  late AudioPlayer player;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();

    // Escucha los cambios de posición
    player.positionStream.listen((Duration position) {
      setState(() {
        currentPosition = position;
      });
    });

    // Escucha los cambios de duración
    player.durationStream.listen((Duration? duration) {
      setState(() {
        totalDuration = duration ?? Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double imgHeight = size.height * .45;

    return Scaffold(
      backgroundColor: const Color(0xFF13122B),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                const Text(
                  "Recently Played",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: size.width,
              height: imgHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage("assets/img/taylor.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            songInfo(),
            audioControls(size),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                decoration: const BoxDecoration(
                  color: Color(0xFF302F42),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: ListView(
                  children: [
                    const Text(
                      "Lyrics",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget songInfo() {
    return const Text(
      "Song Title - Artist",
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  Widget audioControls(Size size) {
    double percentage = totalDuration.inSeconds == 0
        ? 0
        : currentPosition.inSeconds / totalDuration.inSeconds;

    return Column(
      children: [
        Column(
          children: [
            Slider(
              value: currentPosition.inSeconds.toDouble(),
              max: totalDuration.inSeconds.toDouble(),
              onChanged: (value) async {
                await player.seek(Duration(seconds: value.toInt()));
              },
              activeColor: const Color(0xFF643CEB),
              inactiveColor: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(currentPosition),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  formatDuration(totalDuration),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.shuffle, color: Colors.white, size: 28),
            IconButton(
              onPressed: () async {
                await player.seek(Duration.zero);
              },
              icon: const Icon(Icons.skip_previous_rounded,
                  color: Colors.white, size: 28),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF643CEB),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () async {
                  if (player.playing) {
                    await player.pause();
                  } else {
                    await player.setAsset('assets/mp3/SoundHelix.mp3');
                    await player.play();
                  }
                },
                icon: Icon(
                  player.playing ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(Icons.skip_next_rounded, color: Colors.white, size: 28),
            const Icon(Icons.repeat, color: Colors.white, size: 28),
          ],
        ),
      ],
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}


// Azul (fondo)   : 13122B
// Morado / lila  : 643CEB
// gris (lyric)   : 302F42





//just_audio: ^0.9.42