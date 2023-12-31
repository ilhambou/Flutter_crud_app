import 'dart:html';

import '../model/user.model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
Future addUser(User user) async
{
    final docUser = FirebaseFirestore.instance.collection("users").doc();
    user.id = docUser.id;
    await docUser.set(user.toJson()); 
}

Future UpdateUser(User user) async{
  final docUser = FirebaseFirestore.instance.collection("users").doc(user.id);
  await docUser.update(user.toJson());


}

Future deleteuser (String id) async
{
    final docUser = FirebaseFirestore.instance.collection("users").doc(id);
    await docUser.delete();
}
