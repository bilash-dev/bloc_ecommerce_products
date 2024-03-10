import 'dart:async';

import 'package:bloc_ecommerce_project/data/cart_items.dart';
import 'package:bloc_ecommerce_project/data/wishlist_items.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_event.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_state.dart';
import 'package:bloc_ecommerce_project/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final ProductsRepo productsRepo;
  HomeBloc(this.productsRepo): super(HomeInitial()){
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    var productsData = await productsRepo.getProducts();
    emit(HomeLoadedSuccessState(productsData));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('wishlist product clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('cart product clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}