import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gdg_glasgow_devfest/repository.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyScaffols(),
    );
  }
}

class MyScaffols extends StatefulWidget {


  @override
  MyScaffolsState createState() {
    return new MyScaffolsState();
  }
}

class MyScaffolsState extends State<MyScaffols> {


  List<User> _users;

  @override initState() {
    super.initState();
    _users = new List();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new CupertinoNavigationBar(
        middle: new Text('Hello GDG Glasgow!'),
      ),
        body: new ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context,index) => new ListTile(
            leading: new Text('${_users[index].id}'),
            title: new Text('${_users[index].name}'),
            subtitle: new Text('${_users[index].email}'),
            trailing: new Icon(Icons.chevron_right),
          ),
        )
      );

  void _loadUsers() async {
    var result = await loadUsersRemote();
    setState(() => _users = result);
  } 
}
