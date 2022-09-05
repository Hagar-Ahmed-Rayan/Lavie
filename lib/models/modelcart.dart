class CartModel {
  late final String id;
  late final String name;
  late final int quantity;
  late final String imageUrl;
  late final int price;

  CartModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.imageUrl,
   required this.price,
  });

  CartModel.fromDB(Map<String, dynamic> db) {
    id = db['product_id'];
    name = db['name'];
    quantity = db['quantity'];
    imageUrl = db['image_url'];
    price = db['price'];
  }
}

