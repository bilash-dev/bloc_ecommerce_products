import 'dart:async';

import 'package:bloc_ecommerce_project/features/home/bloc/home_event.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_state.dart';
import 'package:bloc_ecommerce_project/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeInitialEvent, HomeState>{
  final ProductsRepo productsRepo;
  HomeBloc(this.productsRepo): super(HomeInitialState()){
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitialState());
    await Future.delayed(Duration(seconds: 3));
    var productsData = await productsRepo.getProducts();
    emit(HomeSuccessState(productsData));
  }
}