import 'dart:async';
import 'package:bloc_ecommerce_project/data/wishlist_items.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_event.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState>{
  WishlistBloc() : super(WishlistInitial()){
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(wishlistRemoveFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveFromWishlistEvent(WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.removeItem);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}