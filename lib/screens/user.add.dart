import 'package:flutter/material.dart';
import 'package:crud_app/repository/user.repo.dart';
import 'package:crud_app/model/user.model.dart';
import '../model/user.model.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _ctrname = TextEditingController();
    final TextEditingController _ctrphone = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10), //marge de 10pixels
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _ctrname,
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
              controller: _ctrphone,
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
              onPressed: () {
                final user = User(name: _ctrname.text, phone: int.parse(_ctrphone.text));
                addUser(user);
                _ctrname.text = '';
                _ctrphone.text='';
              },
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
