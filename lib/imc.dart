import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_sqlite/models.dart';
import 'package:shop_sqlite/notifier.dart';
import 'package:shop_sqlite/shop_database.dart';

class Imc extends StatefulWidget {

  @override
  State<Imc> createState() => _ImcState();
}


class _ImcState extends State<Imc> {
  final _formKey = GlobalKey<FormState>();
  final _meteresController = TextEditingController();
  final _kilogramsController = TextEditingController();
  double _total = 0;

  void _incrementCounter() {
    setState(() {
      double value1 = double.tryParse(_meteresController.text) ?? 0.0;
      double value2 = double.tryParse(_kilogramsController.text) ?? 0.0;

      _total = value2 / ((value1 / 100) * (value1 / 100));

      print(_total.toStringAsFixed(3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _meteresController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Centimetros'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _kilogramsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Kilogramos'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Calcular'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Resultado:  ${_total.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16),
          ),

        ],
      ),
    );
  }

}