import 'package:bloc_ecommerce_project/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_ecommerce_project/features/cart/bloc/cart_event.dart';
import 'package:bloc_ecommerce_project/features/cart/bloc/cart_state.dart';
import 'package:bloc_ecommerce_project/features/cart/ui/cart_tile_widget.dart';
import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
   cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Cart Items'),),
    body: BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state){},
      builder: (context, state){

        switch(state.runtimeType){
          case CartSuccessState:
            final successState = state as CartSuccessState;
          return ListView.builder(
            itemCount: successState.cartItems.length,
            itemBuilder: (context, index){

              return CartTileWidget(
                cartItems: successState.cartItems[index],
                cartBloc: cartBloc,
              );
            },
          );
          default:
        }
        return Container();
      },
    ),
    );
  }
}
