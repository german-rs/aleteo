import 'package:flutter/material.dart';

class GaleriaImagenesProvider with ChangeNotifier {
  final List<String> _imgUrls = [
    "https://picsum.photos/250?image=2",
    "https://picsum.photos/250?image=3",
    "https://picsum.photos/250?image=4",
    "https://picsum.photos/250?image=5",
    "https://picsum.photos/250?image=6",
    "https://picsum.photos/250?image=7",
  ];

  int _gridColumns = 2;
  int _numberColumn = 2;

  List<String> get imgUrls => _imgUrls;
  int get gridColumns => _gridColumns;
  int get numberColumn => _numberColumn;

  void agregarImagen() {
    int ultimoIndice = int.parse(_imgUrls.last.split("?image=")[1]);
    _imgUrls.add("https://picsum.photos/250?image=${ultimoIndice + 1}");
    notifyListeners();
  }

  void cambiarColumnas(int columnas) {
    _gridColumns = columnas;
    _numberColumn = columnas;
    notifyListeners();
  }
}
