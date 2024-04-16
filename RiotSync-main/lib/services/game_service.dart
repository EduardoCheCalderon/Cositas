import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getJuego() async {
  List juegos = [];
  QuerySnapshot querySnapshot = await db.collection('juego').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final juego = {
      "juego": data['juego'],
      "uid": doc.id,
    };
    juegos.add(juego);
  }

  await Future.delayed(const Duration(seconds: 2));

  return juegos;
}

//Agregar juego
Future<void> addJuego(String juego) async {
  await db.collection("juego").add({"juego": juego});
}

//Actualizar juego
Future<void> updateJuego(String uid, String newJuego) async {
  await db.collection("juego").doc(uid).set({"juego": newJuego});
}

//Eliminar juego
Future<void> deleteJuego(String uid) async {
  await db.collection("juego").doc(uid).delete();
}
