import 'package:equatable/equatable.dart';
import '/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  num get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  num deliveryFee(subtotal) {
    if (subtotal >= 3000) {
      return 0;
    } else
      return 100;
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 3000) {
      return 'You have Free Delivery';
    } else {
      num missing = 3000 - subtotal;
      return 'Add \UGX${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  num total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);
}
