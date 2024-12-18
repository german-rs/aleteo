import 'package:flutter/material.dart';

class MoviesPlayerWidget extends StatelessWidget {
  final double height;

  const MoviesPlayerWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: height,
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 90,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'All',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Series',
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  'Movie',
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  'TV Show',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            child: SizedBox(
              width: size.width,
              height: height - 140,
              child: carruselImages(),
            ),
          ),
          Positioned(
            bottom: 10,
            left: size.width * .25,
            right: size.width * .25,
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  points(true),
                  points(true),
                  points(true),
                  points(false),
                  points(true),
                  points(true),
                  points(true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget points(bool isCircle) {
    return Container(
      width: isCircle ? 10 : 48,
      height: 10,
      decoration: BoxDecoration(
        color: isCircle ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget carruselImages() {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 8,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            bottom: 0,
            left: -100,
            child: Transform.rotate(
              angle: -.10,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(22),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/shogun.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 0,
            right: -100,
            child: Transform.rotate(
              angle: .10,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(22),
                  image: const DecorationImage(
                    image: AssetImage('assets/img/it.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 30,
            left: 45,
            right: 45,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                image: const DecorationImage(
                  image: AssetImage('assets/img/brooklyn.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Time to Explore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'TV Series 2023',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 24),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(Icons.play_circle_filled_sharp,
                                  color: Colors.red, size: 32),
                              Icon(Icons.play_arrow,
                                  color: Colors.white, size: 16),
                            ],
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.add, color: Colors.white, size: 32),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
