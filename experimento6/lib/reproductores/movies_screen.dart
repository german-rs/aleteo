import 'package:flutter/material.dart';
import 'movies/movies_appbar_widget.dart';
import 'movies/movies_continue_widget.dart';
import 'movies/movies_player_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightAppBar = size.height * .15;
    double heightPlayer = size.height * .65;
    double heightContinue = size.height * .2;

    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // movies_appbar_widget.dart
            MoviesAppbarWidget(
              height: heightAppBar,
            ),

            // movies_player_widget.dart
            MoviesPlayerWidget(
              height: heightPlayer,
            ),

            // movies_continue_widget.dart
            MoviesContinueWidget(
              height: heightContinue,
            ),
          ],
        ),
      ),
    );
  }
}
