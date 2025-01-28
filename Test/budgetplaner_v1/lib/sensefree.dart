import 'package:flutter/material.dart ';
import 'package:provider/provider.dart';
import 'package:budgetplaner_v1/models/cart_model.dart';

class SenseFree extends StatelessWidget {
  const SenseFree({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cartModel, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 66, 129),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("SenseFree"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    if (cartModel.bp > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 61, 91, 212),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            "BudgetPlanna",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Deine Seele",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.bp.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () => cartModel.clearbp(),
                                  icon:
                                      Icon(Icons.delete, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 25),
                    if (cartModel.pla > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 61, 91, 212),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            "Budget",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "Deine Seele",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cartModel.pla.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () => cartModel.clearpla(),
                                  icon:
                                      Icon(Icons.delete, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 80),
                    if (cartModel.total > 0)
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 61, 91, 212),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            "Wie oft stirbst du?",
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            "${cartModel.total} mal",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${cartModel.se} Seelen",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () => cartModel.clearpla(),
                                  icon:
                                      Icon(Icons.delete, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
