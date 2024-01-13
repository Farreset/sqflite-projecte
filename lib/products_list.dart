import 'dart:js';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:shop_sqlite/shop_database.dart';

import 'models.dart';

class ProductsList extends StatelessWidget {



  var products = [
    Product(1, "Full Body", "Trabajamos el cuerpo completo.","laptop.png",60),
    Product(2, "Torso Superior", "Trabajamos de tronco para arriba.","laptop.png", 40),
    Product(3, "Torso Inferior", "Trabajamos de tronco para abajo,","laptop.png", 40),
    Product(4, "Ejercicos Push", "Trabajamos pecho, hombros y triceps","laptop.png", 25),
    Product(5, "Ejercicos Pull", "Trabajamos brazos y espalda","laptop.png", 25),
    Product(6, "Ejercicos Leg", "Trabajamos solo pierna","laptop.png", 25),
    Product(7, "Espalda", "Trabajamos solo espalda","laptop.png", 15),
    Product(8, "Pecho", "Trabajamos solo pecho","laptop.png", 15),
    Product(9, "Biceps", "Trabajamos solo biceps","laptop.png", 15),
    Product(10, "Triceps", "Trabajamos solo triceps","laptop.png", 15),
    Product(11, "Cuadriceps", "Trabajamos solo cuadriceps","laptop.png", 15),
    Product(12, "Gemelos", "Trabajamos solo gemelos","laptop.png", 15
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(

                 child: _ProductItem(products[index]),
             margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                colors: [
                  Color(0xFF525252),
                  Color(0xFF706E6E),

                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.25, 0.90],
              ),
             ),
            ),
            onTap: () async {
              await addToCart(products[index]);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Producto agregado!"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 5,
            ),
        itemCount: products.length);
  }

  Future<void> addToCart(Product product) async {
    final item = CartItem(
      id: product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      quantity: 1,
    );
    await ShopDatabase.instance.insert(item);
  }
}

class _ProductItem extends StatelessWidget {
  final Product product;

  const _ProductItem(this.product);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/'+product.img,
            width: 100,
          ),
          const Padding(padding: EdgeInsets.only(right: 3, left: 3)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AutoSizeText(
                product.name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // Color del texto dentro del contenedor
                ),
                maxLines: 3, // Número máximo de líneas antes de recortar el texto
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,

              ),
              AutoSizeText(
                  product.description,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white, // Color del texto dentro del contenedor
                ),
                maxLines: 2, // Número máximo de líneas antes de recortar el texto
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,

              ),

              Text(
                  product.price.toString()+'€',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white, // Color del texto dentro del contenedor
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
