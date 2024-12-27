import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/animal_bloc.dart';
import 'favorite_page.dart';
import '../widgets/adopt_appbar.dart';
import '../widgets/adopt_filter.dart';
import '../widgets/adopt_list.dart';
import '../widgets/adopt_bottom_navigation_bar.dart';

class AdoptAppPage extends StatelessWidget {
  const AdoptAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<AnimalBloc>()..add(LoadAnimals()),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBE8DF),
      body: const Column(
        children: [
          AdoptAppBarWidget(),
          AdoptFilterWidget(),
          AdoptListWidget(),
        ],
      ),
      bottomNavigationBar: AdoptBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
