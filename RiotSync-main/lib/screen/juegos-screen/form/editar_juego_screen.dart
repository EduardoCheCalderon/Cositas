import 'package:flutter/material.dart';

class Game {
  String name;
  String image;

  Game({required this.name, required this.image});
}

class EditGameScreen extends StatefulWidget {
  final Game game;

  const EditGameScreen({super.key, required this.game});

  @override
  State<EditGameScreen> createState() => _EditGameScreenState();
}

class _EditGameScreenState extends State<EditGameScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Juego'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                initialValue: widget.game.name,
                decoration: const InputDecoration(
                  labelText: 'Nombre del juego',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onSaved: (value) {
                  widget.game.name = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre del juego es requerido';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                initialValue: widget.game.image,
                decoration: const InputDecoration(
                  labelText: 'Logo del juego (URL)',
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                onSaved: (value) {
                  widget.game.image = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La URL del logo del juego es requerida';
                  }
                  if (!Uri.parse(value).isAbsolute) {
                    return 'La URL del logo del juego debe ser una URL absoluta';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
