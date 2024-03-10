import 'package:bloc_ecommerce_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_event.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_state.dart';
import 'package:bloc_ecommerce_project/features/home/ui/product_tile_widget.dart';
import 'package:bloc_ecommerce_project/repo/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart_screen.dart';
import '../../wishlist/ui/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsRepo productsRepo = ProductsRepo();
  final HomeBloc homeBloc = HomeBloc(ProductsRepo());

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Products App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.productsModel.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        homeBloc: homeBloc,
                        productsModel: successState.productsModel[index]);
                  }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
