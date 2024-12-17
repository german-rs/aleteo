import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imgUrl;
  final int index;

  const ImageView({
    super.key,
    required this.imgUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: index,
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
