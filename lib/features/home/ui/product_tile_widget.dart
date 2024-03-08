import 'package:bloc_ecommerce_project/features/home/bloc/home_event.dart';
import 'package:bloc_ecommerce_project/features/home/models/home_products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductsModel productsModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productsModel, required this.homeBloc});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productsModel.image.toString()),
              )
            ),

          ),
          const SizedBox(height: 20,),
          Text(productsModel.title.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(productsModel.description.toString(), style: TextStyle(fontSize: 14),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productsModel.price.toString()),
              Row(
                children: [
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductWishlistButtonClickEvent(productsModel));
                  }, icon: const Icon(Icons.favorite_outline_outlined)),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductCartButtonClickEvent(productsModel));
                  }, icon: const Icon(Icons.shopping_cart_outlined))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
