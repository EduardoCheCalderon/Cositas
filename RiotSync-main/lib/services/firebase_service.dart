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

Future<void> addRegistro(String name) async {
  await db.collection("registro").add({"Nombre de usuario": name});
  // await db.collection("registro").add({"Email": email});
  // await db.collection("registro").add({"Contraseña": password});
  // await db.collection("registro").add({"Fecha de Nacimiento": dob});
}
