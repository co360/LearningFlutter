import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage lucky = AssetImage('images/rupee.png');
  AssetImage unlucky = AssetImage('images/sadFace.png');

  List<String> itemArray;
  int luckyNumber;
  int clickCounter;
  bool enableClick;

  //TODO: init out array with 25 elements
  @override
  void initState() {
    super.initState();
    debugPrint('initState');

    clickCounter = 0;
    enableClick = true;
    itemArray = List<String>.generate(25, (index) => "empty");

    generateRandomNumber();
  }

  void generateRandomNumber() {
    int random = Random().nextInt(25);
    //print(random);
    setState(() {
      luckyNumber = random;
    });
  }

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      clickCounter = 0;
      enableClick = true;
    });

    generateRandomNumber();
  }

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }

    return circle;
  }

  playGame(int index) {
    setState(() {
      clickCounter++;
    });
    debugPrint("EnableClick: " + enableClick.toString());
    if (clickCounter <= 15 && enableClick == true) {
      if (luckyNumber == index) {
        setState(() {
          itemArray[index] = "lucky";
          enableClick = false;
        });
      } else {
        setState(() {
          itemArray[index] = "unlucky";
        });
      }
    } else {
      String msg = "";
      if (enableClick == false) {
        msg = "Você já achou o botão sortudo!";
      } else {
        msg = "Você já atingiu o limite de tentativas!";
      }

      debugPrint(msg);
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scratch and Win'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: itemArray.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(image: this.getImage(i)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: RaisedButton(
                onPressed: () {
                  this.showAll();
                },
                color: Colors.pink,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Show All',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: RaisedButton(
                onPressed: () {
                  this.resetGame();
                },
                color: Colors.pink,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
