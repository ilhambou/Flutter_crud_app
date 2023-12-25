import 'package:crud_app/repository/user.repo.dart';
import 'package:flutter/material.dart';
import '../../model/user.model.dart';

class ListUserss extends StatefulWidget {
  final List<User> users;

  ListUserss({required this.users});

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUserss> {
  final _ctrupdatename = TextEditingController();
  final _ctrupdatephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final allUsers = widget.users;

    return ListView.builder(
      itemCount: allUsers.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 148, 197, 236),
              child: Text(
                allUsers[index].name.substring(0, 2).toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              allUsers[index].name,
              style: TextStyle(fontSize: 22),
            ),
            subtitle: Text(allUsers[index].phone.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Update: ${allUsers[index].name}'),
                        content: SingleChildScrollView(
                          child: Container(
                            height: 250,
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(fontSize: 22, color: Colors.blue),
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                  ), 
                                  controller: _ctrupdatename,
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  style: TextStyle(fontSize: 22, color: Colors.blue),
                                  decoration: InputDecoration(
                                    labelText: 'Phone',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                    ),
                                  ), 
                                  controller: _ctrupdatephone,
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    final user = User(
                                      id: allUsers[index].id,
                                      name: _ctrupdatename.text, 
                                      phone: int.parse(_ctrupdatephone.text),
                                    );
                                    UpdateUser(user);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    child: Text('Update'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Annuler');
                            }, 
                            child: Text('Annuler')
                          )
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.edit, size: 32, color: Colors.green),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Supprimer ${allUsers[index].name} ?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              deleteuser(allUsers[index].id);
                              Navigator.pop(context, 'Oui');
                            }, 
                            child: Text('Oui')
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, 'Annuler');
                            }, 
                            child: Text('Non')
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.delete, size: 32, color: Colors.red),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
