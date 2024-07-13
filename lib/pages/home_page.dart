import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                usersReference.get().then((value) {
                  QuerySnapshot userCollection = value;
                  List<QueryDocumentSnapshot> docs = userCollection.docs;
                  docs.forEach((element) {
                    print(element.id);
                    print(element.data());
                  });
                });
              },
              child: Text("Traer Data"),
            ),
            ElevatedButton(
              onPressed: () {
                usersReference
                    .where("nombre", isEqualTo: "Pedro")
                    // .where("estatura", isGreaterThan: 175)
                    .get()
                    .then(
                  (value) {
                    QuerySnapshot userCollection = value;
                    List<QueryDocumentSnapshot> docs = userCollection.docs;
                    docs.forEach((e) {
                      print(e.id);
                      print(e.data());
                    });
                  },
                );
              },
              child: Text("Traer Data FILTRADA"),
            ),
            ElevatedButton(
              onPressed: () {
                usersReference.add({
                  'nombre': "Pedro",
                  "apellido": "Fernandez",
                  "estatura": 178,
                  "esPeruano": true,
                }).then((value) {
                  print(value.id);
                });
              },
              child: Text("Agregar usuario"),
            ),
            ElevatedButton(
              onPressed: () {
                usersReference.doc("idNoExiste").set(
                  {
                    'nombre': "Javier",
                    "apellido": "Mader",
                    "estatura": 198,
                    "esPeruano": false,
                  },
                );
              },
              child: Text("Inserción 2"),
            ),
            ElevatedButton(
              onPressed: () {
                usersReference.doc("idNoExiste").update(
                  {
                    "nombre": "Anastacio",
                  },
                );
              },
              child: Text("Actualización"),
            )
          ],
        ),
      ),
    );
  }
}
