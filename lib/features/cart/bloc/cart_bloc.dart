import 'dart:async';

import 'package:bloc_ecommerce_project/data/cart_items.dart';
import 'package:bloc_ecommerce_project/features/cart/bloc/cart_event.dart';
import 'package:bloc_ecommerce_project/features/cart/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  CartBloc(): super(CartInitial()){
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.removeItem);
    emit(CartSuccessState(cartItems: cartItems));
  }
}