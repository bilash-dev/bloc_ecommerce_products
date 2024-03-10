import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';

abstract class HomeState{}

abstract class HomeActionState extends HomeState{}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductsModel> productsModel;
  HomeLoadedSuccessState(this.productsModel);
}

class HomeErrorState extends HomeState{
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}




