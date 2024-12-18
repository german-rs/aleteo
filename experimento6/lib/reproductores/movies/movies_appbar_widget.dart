import 'package:flutter/material.dart';

class MoviesAppbarWidget extends StatelessWidget {
  final double height;

  const MoviesAppbarWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: const DecorationImage(
                    image: AssetImage("assets/img/avatar.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HappyWatching!',
                    style: TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                  Row(
                    children: [
                      Text(
                        'Finnie Rose',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.search,
                size: 24,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.notifications,
                size: 24,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
