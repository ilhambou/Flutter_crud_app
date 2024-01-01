/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud_app/screens/allusers.page.dart';
import 'package:crud_app/screens/user.add.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  /* Function to handle user logout
  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop(); // Navigate back to the login screen
  }*/

  Future<void> _signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    // Naviguer vers votre page de connexion après la déconnexion
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => MyApp()),
      (route) => false,
    );
  } catch (e) {
    print(e.toString());
  }
}



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestion des utilisateurs'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.supervised_user_circle_sharp, size: 28,), text: 'Add'),
              Tab(icon: Icon(Icons.edit_attributes, size: 28,), text: 'Users'),
              Tab(icon: Icon(Icons.search, size: 28,), text: ''),
            ],
          ),
          actions: [
            // Logout button
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => _logout(context),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            AddUserPage(),
            AllUsers(),
            Center(child: Text('Page3'),),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud_app/screens/allusers.page.dart';
import 'package:crud_app/screens/user.add.dart';
import 'package:crud_app/main.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to your login page after logout
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => MyApp()),
        (route) => false,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Management'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _signOut(context),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.supervised_user_circle_sharp, size: 28),
                text: 'Add',
              ),
              Tab(
                icon: Icon(Icons.edit_attributes, size: 28),
                text: 'Users',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AddUserPage(),
            AllUsers(),
          ],
        ),
      ),
    );
  }
}
