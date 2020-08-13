import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: link images
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

  //TODO: initialize the state of box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      setStateEmpty();
    });
  }

  setStateEmpty() {
    this.gameState = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
    ];

    this.message = "";
  }

  //TODO: playGame method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {}
      });
    }
  }

  //TODO: Reset game method
  resetGame() {
    setState(() {
      setStateEmpty();
    });
  }

  //TODO: get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }
  //TODO: check for win logic

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
