import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'api_Service.dart';
import 'connectivity_helper.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> users = [];
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ConnectivityHelper.monitorConnectivity();  // Monitor for connectivity changes
    loadData();  // Load initial data
  }

  // This method will load data from both the API and the local database
  Future<void> loadData() async {
    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      // Fetch data from API only if online
      final data = await APIService.fetchData();
      await DBHelper.clearTable();  // Clear previous data to avoid duplicates
      for (var user in data) {
        await DBHelper.insertUser({
          'id': user['id'],
          'name': user['name'],
          'surname': user['surname'],
          'email': user['email'],
          'password': user['password'],
          'isSynced': 1,
        });
      }
    }

    final localData = await DBHelper.fetchUsers();
    setState(() {
      users = localData.where((user) => user['isSynced'] == 1).toList();
    });
  }

  // Add a user to the database
  Future<void> addUser() async {
    final name = _nameController.text;
    final surname = _surnameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    if (name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty) {
      // Show a simple validation message if any of the fields are empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
      return;
    }

    final newUser = {
      'id': DateTime.now().millisecondsSinceEpoch,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };

    bool online = await ConnectivityHelper.isOnline();

    if (online) {
      bool success = await APIService.insertData(newUser);
      if (success) {
        await DBHelper.insertUser({
          ...newUser,
          'isSynced': 1,
        });
      }
    } else {
      await DBHelper.insertUser({
        ...newUser,
        'isSynced': 0,
      });
    }

    loadData();  // Reload data after adding the new user
    _nameController.clear();
    _surnameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Sync App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addUser,
              child: Text('Add User'),
            ),
            SizedBox(height: 20),
            // Button to manually refresh the ListView
            ElevatedButton(
              onPressed: loadData,
              child: Text('Refresh Data'),  // Refresh button
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index]['name']),
                    subtitle: Text(users[index]['email']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
