import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getRegistro() async {
  List registro = [];
  CollectionReference collectionReferenceRegistro = db.collection('registro');

  QuerySnapshot queryRegistro = await collectionReferenceRegistro.get();

  queryRegistro.docs.forEach((documento) {
    registro.add(documento.data());
  });

  await Future.delayed(const Duration(seconds: 5));

  return registro;
}

Future<void> addRegistro(
    String name, String email, String password, String dob) async {
  await db.collection("registro").add({
    "Nombre de usuario": name,
    "Email": email,
    "Contraseña": password,
    "Fecha de Nacimiento": dob
  });
}
