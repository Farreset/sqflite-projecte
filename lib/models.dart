class Product {
  final int id;
  final String name;
  final String description;
  final String img;
  final int price;

  Product(this.id, this.name, this.description, this.img ,this.price);
}

class Imc {
  final int id;
  final String name;
  final int weight;
  final int height;
  final int total;

  Imc(this.id, this.name, this.weight, this.height ,this.total);
}

class CartItem {
  final int id;
  final String name;
  final int price;
  final String img;
  int quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.img,
      required this.quantity});

  get totalPrice {
    return quantity * price;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'quantity': quantity,
    };
  }
}
