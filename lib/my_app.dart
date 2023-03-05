import "dart:math" as math show Random;

import 'package:flutter/material.dart';

/// the root node for the application
class MyApp extends StatelessWidget {
  /// the constructor for the widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// MyHomePage contians the home Scaffold page
class MyHomePage extends StatefulWidget {
  ///title: is required when using the MyHomePage to set the title of the
  /// Scaffold page

  final String title;

  /// the constructor for MyHomePage widget
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _backgroundColor = Colors.white;
  var _isTextWhite = false;

//the effect of each color component is weighted
  final List<double> weightsArray = const [0.299, 0.587, 0.114, 186];

  Color getRandomColor() {
    /* A Function that returns a list of [randomColor, isTextWhite] */
    final Color randomColor =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

    return randomColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backgroundColor = getRandomColor();
          _isTextWhite = (_backgroundColor.red * weightsArray.first +
                  _backgroundColor.green * weightsArray[1] +
                  _backgroundColor.blue * weightsArray[2]) <
              weightsArray.last;
        });
      },
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(
            "Hey There",
            style: TextStyle(color: _isTextWhite ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
