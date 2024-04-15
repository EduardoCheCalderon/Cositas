import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getJuego() async {
  List juego = [];
  CollectionReference collectionReferenceJuego = db.collection('juego');

  QuerySnapshot queryJuego = await collectionReferenceJuego.get();

  queryJuego.docs.forEach((documento) {
    juego.add(documento.data());
  });

  await Future.delayed(const Duration(seconds: 5));

  return juego;
}

Future<void> addJuego(String juego) async {
   await db.collection("juego").add({"juego": juego});
}