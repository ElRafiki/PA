import "package:budgetplaner_v1/components/button.dart";
import "package:budgetplaner_v1/components/events.dart";
import "package:flutter/material.dart";

class MenuSeite extends StatefulWidget {
  const MenuSeite({super.key});

  @override
  State<MenuSeite> createState() => _MenuSeiteState();
}

class _MenuSeiteState extends State<MenuSeite> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    List evente = [
      Events(
        name: "BudgetPlanna",
        price: "€ 5020",
        imagePath: "lib/images/japan7.png",
        rate: "5",
        details: () => Navigator.pushNamed(context, "/festivalpage"),
      ),
      Events(
        name: "Budget",
        price: "€ 20",
        imagePath: "lib/images/japan3.png",
        rate: "4",
        details: () => Navigator.pushNamed(context, "/budgetpage"),
      ),
      Events(
        name: "Planna",
        price: "€ 50",
        imagePath: "lib/images/japan6.png",
        rate: "5",
        details: () {},
      ),
    ];

    return Scaffold(
      backgroundColor:
          isDark ? Colors.black : Color.fromARGB(255, 211, 66, 129),
      appBar: AppBar(
        title: Text("Menü"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(65, 21, 45, 100),
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
            },
            icon: isDark
                ? Icon(
                    Icons.light_mode,
                    color: Colors.white,
                  )
                : Icon(Icons.dark_mode),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, "/sensefree")),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Color(0xffffb46c),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "Was Passiert gerade?",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    MyButton(
                      mytext: "Öhhhm",
                      event: () {},
                    ),
                  ],
                ),
                Image.asset(
                  "lib/images/japan1.png",
                  height: 110,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Suche",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.5),
            child: Text(
              "Events",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => evente[index],
              itemCount: evente.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.5),
            child: Text(
              "Null Ahnung",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 94, 185, 160),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "lib/images/japan2.png",
                  height: 115,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hilfe",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    SizedBox(height: 10),
                    Text("MaximalstHilfe",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
