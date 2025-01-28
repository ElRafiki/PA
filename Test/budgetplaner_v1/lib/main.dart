import 'package:budgetplaner_v1/models/cart_model.dart';
import 'package:budgetplaner_v1/pages/event_seiten/budget.dart';
import 'package:budgetplaner_v1/pages/event_seiten/festival.dart';
import 'package:budgetplaner_v1/pages/menu_seite.dart';
import 'package:budgetplaner_v1/pages/start_seite.dart';
import 'package:budgetplaner_v1/sensefree.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => CartModel(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartSeite(),
      routes: {
        "/start": (context) => StartSeite(),
        "/menupage": (context) => MenuSeite(),
        "/festivalpage": (context) => FestivalPage(),
        "/budgetpage": (context) => BudgetPage(),
        "/sensefree": (context) => SenseFree(),
      },
    );
  }
}
