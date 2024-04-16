import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getRegistro() async {
  List registros = [];
  QuerySnapshot querySnapshot = await db.collection('registro').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final registro = {
      "registro": data['registro'],
      "uid": doc.id,
    };
    registros.add(registro);
  }

  await Future.delayed(const Duration(seconds: 2));

  return registros;
}

//Agregar datos
Future<void> addRegistro(
    String name, String email, String password, String dob) async {
  await db.collection("registro").add({
    "Nombre de usuario": name,
    "Email": email,
    "Contraseña": password,
    "Fecha de Nacimiento": dob
  });
}

//Actualizar datos
Future<void> updateRegistro(String uid, String newRegistro) async {
  await db.collection("registro").doc(uid).set({"registro": newRegistro});
}

//borrar datos
Future<void> deleteRegistro(String uid) async {
  await db.collection("registro").doc(uid).delete();
}