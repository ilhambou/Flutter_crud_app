import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10), // Utilisation de padding au lieu de margin
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              style: TextStyle(fontSize: 22),
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Icon(Icons.add, size: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
