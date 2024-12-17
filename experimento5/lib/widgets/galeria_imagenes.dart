import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'galeria_imagenes_provider.dart';
import 'seccion_encabezado.dart';
import 'seccion_de_textos.dart';
import 'seccion_cuerpo.dart';
import 'image_view.dart';

class GaleriaImagenes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size tamanio = MediaQuery.of(context).size;
    var provider = Provider.of<GaleriaImagenesProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF275846),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SeccionEncabezado(
              agregarImagen: provider.agregarImagen,
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: tamanio.width,
              child: const SeccionDeTextos(),
            ),
          ),
          const SizedBox(height: 36),
          SeccionCuerpo(
            imgUrls: provider.imgUrls,
            gridColumns: provider.gridColumns,
            numberColumn: provider.numberColumn,
            cambiarColumnas: provider.cambiarColumnas,
          ),
        ],
      ),
    );
  }
}
