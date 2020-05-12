import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tie-Break",
            style: TextStyle(color: Colors.amber[100]),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: BodyPage(),
        backgroundColor: Colors.grey.shade800,
      ),
    );
  }
}

class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  int leftDiceNumber = 1;
  int rightDiceNumer = 6;
  Widget flag;
  void changeNumber() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumer = Random().nextInt(6) + 1;
      flag = oddEveSelect();
    });
  }

  Widget oddEveSelect() {
    int temp = leftDiceNumber + rightDiceNumer;
    String str;
    if ((temp % 2) == 0) {
      str = "Even!! It's $temp";
    } else {
      str = "Odd!! It's $temp";
    }
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          str,
          style: TextStyle(
              color: Colors.amberAccent,
              fontWeight: FontWeight.w900,
              fontSize: 64.0,
              fontFamily: 'Comfortaa'),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "To Break A Tie : ",
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 36.0,
                      fontFamily: 'Comfortaa'),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "1. Choose Odd or Even.\n2. Tap the Dice below.",
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w200,
                      fontSize: 24.0,
                      fontFamily: 'Comfortaa'),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          child: Image.asset("images/dice$leftDiceNumber.png"),
                          onPressed: () {
                            changeNumber();
                          },
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          child: Image.asset("images/dice$rightDiceNumer.png"),
                          onPressed: () {
                            changeNumber();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: flag,
            ),
          ],
        ),
      ),
    );
  }
}
