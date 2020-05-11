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
      str = "Even!!\nIt's $temp";
    } else {
      str = "Odd!!\nIt's $temp";
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        str,
        style: TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.w900,
            fontSize: 72.0,
            fontFamily: 'Comfortaa'),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "To Break A Tie : ",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w800,
                  fontSize: 36.0,
                  fontFamily: 'Comfortaa'),
              textAlign: TextAlign.left,
            ),
            Text(
              "1. Choose Odd or Even.\n2. Tap the Dice below.",
              style: TextStyle(
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w200,
                  fontSize: 24.0,
                  fontFamily: 'Comfortaa'),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Expanded(
                  child: FlatButton(
                    child: ColorFiltered(
                      child: Image.asset("images/dice$leftDiceNumber.png"),
                      colorFilter:
                          ColorFilter.mode(Colors.amber, BlendMode.color),
                    ),
                    onPressed: () {
                      changeNumber();
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    child: ColorFiltered(
                      child: Image.asset("images/dice$rightDiceNumer.png"),
                      colorFilter:
                          ColorFilter.mode(Colors.amber, BlendMode.color),
                    ),
                    onPressed: () {
                      changeNumber();
                    },
                  ),
                ),
              ],
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
