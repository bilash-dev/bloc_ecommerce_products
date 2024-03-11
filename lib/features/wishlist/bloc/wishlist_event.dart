import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class WishlistEvent{}

class WishlistInitialEvent extends WishlistEvent{

}

class WishlistRemoveFromWishlistEvent extends WishlistEvent{
  final ProductsModel removeItem;
  WishlistRemoveFromWishlistEvent({required this.removeItem});
}