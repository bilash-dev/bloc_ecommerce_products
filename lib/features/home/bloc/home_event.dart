import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class HomeLoadedEvent extends HomeEvent{}

class HomeProductWishlistButtonClickEvent extends HomeEvent{
  final ProductsModel clickedProduct;
  HomeProductWishlistButtonClickEvent(this.clickedProduct);
}

class HomeProductCartButtonClickEvent extends HomeEvent{
  final ProductsModel clickedProduct;
  HomeProductCartButtonClickEvent(this.clickedProduct);
}