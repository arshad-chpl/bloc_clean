import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/joke_bloc.dart';

class JokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Joke')),
      body: Center(
        child: BlocBuilder<JokeBloc, JokeState>(
          builder: (context, state) {
            if (state is JokeInitial) {
              return Text('Press the button to load a joke');
            } else if (state is JokeLoading) {
              return CircularProgressIndicator();
            } else if (state is JokeLoaded) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.joke.setup, style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Text(state.joke.punchline,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            } else if (state is JokeError) {
              return Text(state.message);
            }
            return SizedBox();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<JokeBloc>().add(LoadJoke()),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
