import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        usersReference.get().then((value) {
          QuerySnapshot userCollection = value;
          print(value);
        });
      }),
      appBar: AppBar(
        title: Text("home"),
      ),
    );
  }
}
