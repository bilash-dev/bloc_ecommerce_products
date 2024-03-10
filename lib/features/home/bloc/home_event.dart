import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class HomeEvent{}

class HomeInitialEvent extends HomeEvent{}

class HomeLoadedEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductsModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductsModel clickedProduct;
  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}