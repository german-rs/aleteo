import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//stl + enter
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  final String title = 'My Aplication';

  void showCustomToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Este es un mensaje',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.w500,
                color: Colors.white70),
          ),
          centerTitle: true,
          leading: const FlutterLogo(),
          actions: const [
            Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.white70,
                ))
          ],
          backgroundColor: Colors.grey[800],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[700],
              child: const Text(
                "Encabezado",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),

            //Espacio central con un stack.
            Expanded(
                child: SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                children: [
                  //Fondo.
                  Container(
                    color: Colors.grey[200],
                  ),

                  //Elemento posicionado.
                  Positioned(
                    top: size.height * .2,
                    left: 20,
                    child: const Text(
                      'Texto en posición absoluta',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontFamily: 'monospace'),
                    ),
                  ),

                  //Botón flotante.
                  Positioned(
                    right: 16,
                    bottom: isAndroid ? 16 : 50,
                    child: FloatingActionButton(
                      onPressed: () => showCustomToast(context),
                      child: const Icon(Icons.add),
                    ),
                  ),

                  //El otro botón flotante.
                  Positioned(
                      left: 16,
                      bottom: isAndroid ? 16 : 50,
                      child: FloatingActionButton(
                        onPressed: () => showCustomToast(context),
                        child: const Icon(Icons.add),
                      ))
                ],
              ),
            )),
            //Pie de página
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.grey[700],
              child: const Text(
                'Pie de página',
                style: TextStyle(
                  color: Colors.white60,
                  fontFamily: 'monospace',
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
