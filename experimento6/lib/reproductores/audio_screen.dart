import 'package:experimento6/reproductores/audio/audio_appbar_widget.dart';
import 'package:experimento6/reproductores/audio/audio_image_container_widget.dart';
import 'package:experimento6/reproductores/audio/audio_lyrics_widget.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'audio/audio_controls_widget.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late AudioPlayer player;
  Duration? _totalDuration = const Duration(seconds: 0);
  Duration _currentPosition = Duration.zero;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset('assets/mp3/song.mp3').catchError((error) {
      print("Error loading audio asset: $error");
    });

    player.durationStream.listen((duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    player.positionStream.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  void _playPause() {
    setState(() {
      if (player.playing) {
        player.pause();
      } else {
        player.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF13122B),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * .07,
                left: 0,
                right: 0,
                child: const AudioAppbarWidget(),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * .15,
                child: const AudioImageContainerWidget(
                    imagePath: "assets/img/vnv.jpg"),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * .22,
                child: AudioControlsWidget(
                  player: player,
                  currentPosition: _currentPosition,
                  totalDuration: _totalDuration ?? Duration.zero,
                  playPause: _playPause,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AudioLyricsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
