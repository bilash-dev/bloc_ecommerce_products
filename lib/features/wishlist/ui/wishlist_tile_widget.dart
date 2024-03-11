import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_event.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductsModel wishlistItem;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({required this.wishlistItem, required this.wishlistBloc, super.key});

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
                  image: NetworkImage(wishlistItem.image.toString()),
                )
            ),
          ),
          const SizedBox(height: 20,),
          Text(wishlistItem.title.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(wishlistItem.description.toString()),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + wishlistItem.price.toString()),
              Row(
                children: [
                  // IconButton(onPressed: (){
                  //   homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productsModel));
                  // }, icon: const Icon(Icons.favorite_outline_outlined)),
                  IconButton(onPressed: (){
                    wishlistBloc.add(WishlistRemoveFromWishlistEvent(removeItem: wishlistItem));
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
