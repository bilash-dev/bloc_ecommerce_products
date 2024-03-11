import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class WishlistState{}

class WishlistInitial extends WishlistState{}

class WishlistSuccessState extends WishlistState{
  final List<ProductsModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});

}