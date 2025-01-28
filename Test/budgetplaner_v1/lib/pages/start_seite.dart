import 'package:budgetplaner_v1/components/button.dart';
import 'package:flutter/material.dart';

class StartSeite extends StatelessWidget {
  const StartSeite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 66, 129),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Budgetplaner",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 34, 189),
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "lib/images/japanflag.png",
                    height: 30,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Image.asset(
                  "lib/images/japan5.png",
                  height: 350,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Erleben Sie den BudgetPlaner",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 34, 189),
                    )),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "バジェットプランナーを体験する",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 29, 34, 189),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text("Erwarten Sie nicht zu viel",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 29, 34, 189),
                    )),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: MyButton(
                  mytext: "Erwarten 'Sie' nicht zu viel!",
                  event: () => Navigator.pushNamed(context, "/menupage"),
                ),
              ),
            ],
          ),
        ));
  }
}
