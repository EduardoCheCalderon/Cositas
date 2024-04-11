import 'package:flutter/material.dart';

class JuegosScreen extends StatefulWidget {
  const JuegosScreen({super.key});

  @override
  State<JuegosScreen> createState() => _JuegosScreenState();
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
      body: Column(
        children: [
          _buildHeader(),
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

Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Juegos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.tune,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

class Game {
  final String name;
  final String image;

  Game({required this.name, required this.image});
}
