import 'package:flutter/material.dart';
import 'package:riot_sync/services/game_service.dart';

class EditGameScreen extends StatefulWidget {
  @override
  _EditGameScreenState createState() => _EditGameScreenState();
}

class _EditGameScreenState extends State<EditGameScreen> {
  final _formKey = GlobalKey<FormState>();
    TextEditingController juegoController = TextEditingController(text: "");

  @override

  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    juegoController.text = arguments['juego'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Juego',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: juegoController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del juego',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 108, 108, 108)),
                  ),
                  prefixIcon: Icon(
                    Icons.gamepad,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del juego';
                  }
                  return null;
                },
              ),
            ),

            // const SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: TextFormField(
            //     decoration: const InputDecoration(
            //       labelText: 'Logo del juego (URL)',
            //       labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            //       focusedBorder: UnderlineInputBorder(
            //         borderSide:
            //             BorderSide(color: Color.fromARGB(255, 108, 108, 108)),
            //       ),
            //       prefixIcon: Icon(
            //         Icons.link,
            //         color: Color.fromARGB(255, 108, 108, 108),
            //       ),
            //     ),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Por favor, ingrese la URL del logo del juego';
            //       }
            //       return null;
            //     },
            //   ),
            // ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await updateJuego(arguments['uid'], juegoController.text)
                    .then((_) {
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(26, 30, 37, 1),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Editar'),
            ),
          ],
        ),
      ),
    );
  }
}
