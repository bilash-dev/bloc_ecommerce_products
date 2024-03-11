import 'package:bloc_ecommerce_project/features/cart/ui/cart_screen.dart';
import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class CartState{}

abstract class CartActionState extends CartState{}

class CartInitial extends CartState{}

class CartSuccessState extends CartState{
  final List<ProductsModel> cartItems;

  CartSuccessState({required this.cartItems});
}