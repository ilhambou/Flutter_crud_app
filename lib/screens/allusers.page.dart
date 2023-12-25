import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/screens/widgets/users.list.dart';
import 'package:flutter/material.dart';

import '../model/user.model.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  _AllUsersState createState() => _AllUsersState();
} 

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }

          if (snapshot.hasData) {
            List<User> allUsers = snapshot.data!.docs
                .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>))
                .toList();

            return ListUserss(users: allUsers);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
