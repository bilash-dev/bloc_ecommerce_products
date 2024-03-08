import 'package:bloc_ecommerce_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_event.dart';
import 'package:bloc_ecommerce_project/features/home/bloc/home_state.dart';
import 'package:bloc_ecommerce_project/features/home/ui/product_tile_widget.dart';
import 'package:bloc_ecommerce_project/repo/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsRepo productsRepo = ProductsRepo();
  HomeBloc homeBloc = HomeBloc(ProductsRepo());

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text('Product Items'),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(onPressed: (){
          productsRepo.getProducts();
          // print('wishlist clicked');
        }, icon: const Icon(Icons.favorite_border_outlined)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined))
      ],),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state){

        },
        builder: (context, state){
          if(state is HomeInitialState){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }else if(state is HomeSuccessState){
            return ListView.builder(
              itemBuilder: (context, index){
                return ProductTileWidget(
                    productsModel: state.productsModel[index],
                    homeBloc: homeBloc);
              },
            );
          }else if(state is HomeErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
