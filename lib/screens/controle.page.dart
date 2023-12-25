import 'package:flutter/material.dart';
import 'package:crud_app/screens/user.add.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gestion des utilisateurs'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.supervised_user_circle_sharp, size: 28,), text: 'Add'),
              Tab(icon: Icon(Icons.edit_attributes, size: 28,), text: 'Users'),
              Tab(icon: Icon(Icons.search, size: 28,), text: 'Search'),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            AddUserPage(),
            Center(child: Text('Page2'),),
            Center(child: Text('Page3'),),
          ],
        ),
      ),
    );
  }
}
