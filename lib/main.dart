import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _onButtonPressed(),
              child: const Text('show'),
            ),
            Text(
              _selectedItem,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/flags/$_selectedItem.png'),
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: _buildBottomNavigationMenu(),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: [
        ListTile(
            leading: const Icon(Icons.ac_unit),
            title: const Text('Germany'),
            onTap: (() {
              _selectItem('germany');
              print(_selectedItem);
            })),
        ListTile(
            leading: const Icon(Icons.accessibility_new),
            title: const Text('Egypt'),
            onTap: (() {
              _selectItem('egypt');
              print(_selectedItem);
            })),
        ListTile(
            leading: const Icon(Icons.assessment),
            title: const Text('Cambodia'),
            onTap: (() {
              _selectItem('cambodia');
              print(_selectedItem);
            })),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
