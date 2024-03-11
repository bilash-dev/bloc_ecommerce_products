import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class CartEvent{}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartEvent extends CartEvent{
  final ProductsModel removeItem;
  CartRemoveFromCartEvent({required this.removeItem});
}