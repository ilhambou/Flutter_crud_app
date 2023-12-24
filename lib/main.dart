import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  TextEditingController _textEditingController = TextEditingController();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Firebase"),
        ),
        body: Center(
          child: Column(
            children:[
              TextField(
                controller: _textEditingController,
              ),
              FilledButton(onPressed:(){
                final user = <String, dynamic>{
                  "Total_amount": _textEditingController.text,
                };
                _firebaseFirestore.collection("cash").add(user);

              },child: Text("press")
              )
            ]
          )
        ),
      ),
    );
  }
}
