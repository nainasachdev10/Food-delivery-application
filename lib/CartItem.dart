// CartItem.dart
class CartItem {
  final String name;
  final double price;
  final int quantity;
   // Add imagePath property

  CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    // Update constructor to include imagePath
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
