import 'package:flutter/material.dart';

class GaleriaImagenesPage extends StatefulWidget {
  const GaleriaImagenesPage({super.key});

  @override
  State<GaleriaImagenesPage> createState() => _GaleriaImagenesPageState();
}

class _GaleriaImagenesPageState extends State<GaleriaImagenesPage> {
  final List<String> imgUrls = [
    "https://picsum.photos/250?image=2",
    "https://picsum.photos/250?image=3",
    "https://picsum.photos/250?image=4",
    "https://picsum.photos/250?image=5",
    "https://picsum.photos/250?image=6",
    "https://picsum.photos/250?image=7",
  ];

  int gridColumns = 2; // Número inicial de columnas (2 columnas por defecto)

  addImage() {
    int lastIndex = int.parse(imgUrls.last.split("?image=")[1]);
    setState(() {
      imgUrls.add("https://picsum.photos/250?image=${lastIndex + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF275846),
      body: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: headerSection(context),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SizedBox(
              width: size.width,
              child: textSection(),
            ),
          ),
          const SizedBox(height: 36),
          bodySection(),
        ],
      ),
    );
  }

  Widget headerSection(BuildContext context) {
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
          onTap: addImage,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  Widget textSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Image Gallery",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "Created 2 days ago",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget bodySection() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recently Added",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.grid_view),
                      onPressed: () {
                        setState(() {
                          gridColumns = 2; // Cambia a 2 columnas
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.grid_on_sharp),
                      onPressed: () {
                        setState(() {
                          gridColumns = 3; // Cambia a 3 columnas
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumns, // Número de columnas dinámico
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: imgUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = imgUrls[index];
                  return GestureDetector(
                    onTap: () {
                      // Mostrar el diálogo al presionar la imagen
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(url),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
