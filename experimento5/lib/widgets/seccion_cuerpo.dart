import 'package:flutter/material.dart';
import 'image_view.dart';

class SeccionCuerpo extends StatelessWidget {
  final List<String> imgUrls;
  final int gridColumns;
  final int numberColumn;
  final Function(int) cambiarColumnas;

  const SeccionCuerpo({
    super.key,
    required this.imgUrls,
    required this.gridColumns,
    required this.numberColumn,
    required this.cambiarColumnas,
  });

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () => cambiarColumnas(2),
                      icon: const Icon(Icons.grid_view),
                      color: numberColumn == 2 ? Colors.blue : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => cambiarColumnas(3),
                      icon: const Icon(Icons.grid_on_sharp),
                      color: numberColumn == 3 ? Colors.blue : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridColumns,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: imgUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  String url = imgUrls[index];
                  return Hero(
                    tag: index,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageView(
                              imgUrl: url,
                              index: index,
                            ),
                          ),
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
