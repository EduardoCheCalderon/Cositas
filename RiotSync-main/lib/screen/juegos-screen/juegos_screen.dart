import 'package:flutter/material.dart';
import 'package:riot_sync/services/game_service.dart';

class JuegosScreen extends StatefulWidget {
  const JuegosScreen({super.key});

  @override
  State<JuegosScreen> createState() => _JuegosScreenState();
}

class _JuegosScreenState extends State<JuegosScreen> {
  // List<Game> _games = [
  //   Game(name: 'Valorant', image: 'assets/logo_valorant.png'),
  //   Game(name: 'League of Legends', image: 'assets/logo_lol.png'),
  // ];

  void _addGame() {
    // Add a new game to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getJuego(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  String? juego = snapshot.data?[index]['juego'];
                  if (juego != null) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        await deleteJuego(snapshot.data?[index]['uid']);
                        snapshot.data?.removeAt(index);
                      },
                      confirmDismiss: (direction) async {
                        bool result = false;
                        result = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                    "¿Estas seguro de eliminar ${snapshot.data?[index]['juego']}?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          false,
                                        );
                                      },
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        return Navigator.pop(
                                          context,
                                          true,
                                        );
                                      },
                                      child: const Text("Si, estoy seguro")),
                                ],
                              );
                            });
                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd,
                      key: Key(snapshot.data?[index]['uid']),
                      child: ListTile(
                        title: Text(juego),
                        onTap: (() async {
                          await Navigator.pushNamed(context, 'edit_game_screen',
                              arguments: {
                                "juego": snapshot.data?[index]['juego'],
                                "uid": snapshot.data?[index]['uid'],
                              });
                          setState(() {});
                        }),
                      ),
                    );
                  }
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'add_game_screen');
      //   },
      //   child: const Icon(Icons.add),
      // ),
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
