import 'package:flutter/material.dart';

class MoviesContinueWidget extends StatelessWidget {
  final double height;

  const MoviesContinueWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Row(
                  children: [
                    Icon(Icons.fast_forward, color: Colors.red),
                    SizedBox(width: 10),
                    Text(
                      'Continue watching',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.home, color: Colors.white),
                  Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.stars_sharp, color: Colors.white),
                  Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.list_alt_outlined, color: Colors.white),
                  Text(
                    'List',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.download_for_offline_rounded, color: Colors.white),
                  Text(
                    'Download',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
