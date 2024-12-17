import 'package:flutter/material.dart';

class SeccionEncabezado extends StatelessWidget {
  final Function agregarImagen;

  SeccionEncabezado({
    required this.agregarImagen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 38,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white38,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => agregarImagen(),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
