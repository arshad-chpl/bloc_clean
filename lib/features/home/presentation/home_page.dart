import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Features')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/todos'),
            child: Text('Todos'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/notes'),
            child: Text('Notes'),
          ),
          // ElevatedButton(
          //     onPressed: () => Navigator.pushNamed(context, '/groceries'),
          //     child: Text('Groceries')),
        ],
      ),
    );
  }
}
