import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Features')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/todos'),
              child: Text('Todos'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/notes'),
              child: Text('Notes'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/joke'),
              child: Text('Joke'),
            ),
            // ElevatedButton(
            //     onPressed: () => Navigator.pushNamed(context, '/groceries'),
            //     child: Text('Groceries')),
          ],
        ),
      ),
    );
  }
}
