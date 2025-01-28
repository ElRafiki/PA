import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String mytext;
  final void Function()? event;
  const MyButton({
    super.key,
    required this.mytext,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 29, 34, 189),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(mytext,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward, color: Colors.white, size: 30),
        ]),
      ),
    );
  }
}
