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
                    });
                  });
                },
                child: Text("Traer Data"))
          ],
        ),
      ),
    );
  }
}
