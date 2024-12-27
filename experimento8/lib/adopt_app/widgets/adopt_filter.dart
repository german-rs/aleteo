import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../bloc/animal_bloc.dart';

class AdoptFilterWidget extends StatelessWidget {
  const AdoptFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double cardWidth = size.width * .2;

    return SizedBox(
      height: 130,
      child: BlocBuilder<AnimalBloc, AnimalState>(
        builder: (context, state) {
          bool isSelectedDog = state.filter == "dog";
          bool isSelectedCat = state.filter == "cat";
          bool isSelectedBird = state.filter == "bird";
          bool isSelectedRep = state.filter == "reptile";
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCardWidget(
                context,
                cardWidth,
                icon: Icon(
                  MdiIcons.dog,
                  color: isSelectedDog ? Colors.white : const Color(0xFF91C9B9),
                ),
                title: "Dog",
                isSelected: isSelectedDog,
              ),
              buildCardWidget(
                context,
                cardWidth,
                icon: Icon(
                  MdiIcons.cat,
                  color: isSelectedCat ? Colors.white : const Color(0xFF91C9B9),
                ),
                title: "Cat",
                isSelected: isSelectedCat,
              ),
              buildCardWidget(
                context,
                cardWidth,
                icon: Icon(
                  MdiIcons.bird,
                  color:
                      isSelectedBird ? Colors.white : const Color(0xFF91C9B9),
                ),
                title: "Bird",
                isSelected: isSelectedBird,
              ),
              buildCardWidget(
                context,
                cardWidth,
                icon: Icon(
                  MdiIcons.turtle,
                  color: isSelectedRep ? Colors.white : const Color(0xFF91C9B9),
                ),
                title: "Reptile",
                isSelected: isSelectedRep,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCardWidget(
    BuildContext context,
    double width, {
    required Icon icon,
    required String title,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.read<AnimalBloc>().add(ChangeFilter(title.toLowerCase()));
        }
      },
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF91C9B9) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF91C9B9),
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
