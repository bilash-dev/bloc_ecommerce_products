import 'package:bloc_ecommerce_project/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_ecommerce_project/features/cart/bloc/cart_event.dart';
import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductsModel cartItems;
  final CartBloc cartBloc;
  const CartTileWidget({required this.cartItems,required this.cartBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(cartItems.image.toString()),
              )
            ),
          ),
          const SizedBox(height: 20,),
          Text(cartItems.title.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(cartItems.description.toString()),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + cartItems.price.toString()),
              Row(
                children: [
                  // IconButton(onPressed: (){
                  //   homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productsModel));
                  // }, icon: const Icon(Icons.favorite_outline_outlined)),
                  IconButton(onPressed: (){
                    cartBloc.add(CartRemoveFromCartEvent(removeItem: cartItems));
                  }, icon: const Icon(Icons.remove_circle_outline))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
