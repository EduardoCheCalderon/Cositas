import 'package:flutter/material.dart';

class JuegosScreen extends StatefulWidget {
  const JuegosScreen({super.key});

  @override
  _JuegosScreenState createState() => _JuegosScreenState();
}

class _JuegosScreenState extends State<JuegosScreen> {
  List<Game> _games = [
    Game(name: 'Valorant', image: 'assets/logo_valorant.png'),
    Game(name: 'League of Legends', image: 'assets/logo_lol.png'),
  ];

  void _addGame() {
    // Add a new game to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Juegos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _games.length,
              itemBuilder: (context, index) {
                final game = _games[index];
                return _buildGameCard(game);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'add_game_screen');
            },
            child: Text('Nuevo Juego'),
          ),
        ],
      ),
    );
  }

  Widget _buildGameCard(Game game) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(game.image, width: 50),
        title: Text(game.name),
      ),
    );
  }
}

class Game {
  final String name;
  final String image;

  Game({required this.name, required this.image});
}
