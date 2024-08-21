import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceryshop_bloc/cart/ui/cart.dart';
import 'package:flutter_groceryshop_bloc/home/bloc/home_bloc.dart';
import 'package:flutter_groceryshop_bloc/home/ui/product_tile.dart';
import 'package:flutter_groceryshop_bloc/wishlist/ui/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

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
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        } else if (state is HomeNavigateToWishListActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishlistPage(),
              ));
        } else if (state is HomeItemWishListedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to wishlist")));
        } else if (state is HomeItemCartedActiontate) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item added to your cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case const (HomeLoadingState):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case const (HomeSuccessfullyLoadedState):
            final successState = state as HomeSuccessfullyLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Grocery App"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToWishList());
                      },
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToCart());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
                },
              ),
            );
          case const (HomeErrorState):
            return const Scaffold(
              body: Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
