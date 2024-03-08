import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitialState extends HomeState{}

class HomeSuccessState extends HomeState{
  final List<ProductsModel> productsModel;
  HomeSuccessState(this.productsModel);
}

class HomeErrorState extends HomeState{
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}

class HomeProductWishlistClickState extends HomeActionState{}

class HomeProductCartClickState extends HomeActionState{}


