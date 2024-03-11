import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_event.dart';
import 'package:bloc_ecommerce_project/features/wishlist/bloc/wishlist_state.dart';
import 'package:bloc_ecommerce_project/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist Items'),),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        // listenWhen: (previous, current) => current is CartActionState,
        // buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state){},
        builder: (context, state){

          switch(state.runtimeType){
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index){

                  return WishlistTileWidget(
                    wishlistItem: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
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
