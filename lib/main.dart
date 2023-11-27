import 'package:flutter/material.dart';
import 'addition.dart';
import 'subtraction.dart';
import 'multiplication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Game'),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the math game. Please choose the game that you want to start with:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          RoundedBoxList(),
        ],
      ),
    );
  }
}

class RoundedBoxList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedBox(
            text: 'Add',
            description: 'Addition game',
            onTap: () {
              navigateToGamePage(context, Add());
            },
          ),
          SizedBox(height: 16),
          RoundedBox(
            text: 'Subtract',
            description: 'Subtraction game',
            onTap: () {
              navigateToGamePage(context, Sub());
            },
          ),
          SizedBox(height: 16),
          RoundedBox(
            text: 'Multiply',
            description: 'Multiplication game',
            onTap: () {
              navigateToGamePage(context, Mult());
            },
          ),
        ],
      ),
    );
  }
}

class RoundedBox extends StatelessWidget {
  final String text;
  final String description;
  final VoidCallback onTap;

  const RoundedBox({
    required this.text,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 150,
        padding:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Arial',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

void navigateToGamePage(BuildContext context, Widget next) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GamePage(next: next),
    ),
  );
}

class GamePage extends StatelessWidget {
  final Widget next;

  const GamePage({
    required this.next,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: next,
      ),
    );
  }
}
