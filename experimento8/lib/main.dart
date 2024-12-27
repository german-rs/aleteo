import 'package:experimento8/adopt_app/pages/adopt_page.dart';
import 'package:experimento8/adopt_app/bloc/animal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AnimalBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AdoptAppPage(),
      ),
    ),
  );
}
