import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sqlite/products_list.dart';

import 'my_cart.dart';
import 'notifier.dart';
import 'imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FITPAL',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CartNotifier(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FITNESS"),
      ),
      body: _selectedIndex == 0
          ? ProductsList()
          : _selectedIndex == 1
          ? Imc()
          : MyCart(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lista de ejercicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Calculo del IMC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Rutina',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}


