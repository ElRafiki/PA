import 'package:budgetplaner_v1/components/button.dart';
import 'package:budgetplaner_v1/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 66, 129),
        appBar: AppBar(
          title: Text("Menü"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(65, 21, 45, 100),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.dark_mode),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Icon(Icons.shopping_cart),
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Image.asset("lib/images/japan3.png", height: 300),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 30,
                ),
                Text(
                  "4,0",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            const SizedBox(
                height: 15), // const is used to avoid unnecessary rebuilds
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "Weiterhin Kein Plan V2 ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const Text(
                "Keine Ahnung was ich hier schreiben soll V2",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "Ipsum Lorem und so weiter und so fort. Lorem Ipsum und so weiter und so fort. Planlos und so weiter und so fort. V2 ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                color: Color.fromARGB(255, 61, 91, 212),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "€ Deine Seele",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                  onPressed: cartModel.removePla,
                                  icon: Icon(Icons.remove)),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              cartModel.pla.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: cartModel.addPla,
                                icon: Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    MyButton(
                      mytext: "Zur Sinnlosigkeit",
                      event: () => Navigator.pushNamed(context, "/sensefree"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
