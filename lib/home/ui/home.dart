import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceryshop_bloc/cart/ui/cart.dart';
import 'package:flutter_groceryshop_bloc/home/bloc/home_bloc.dart';
import 'package:flutter_groceryshop_bloc/wishlist/ui/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
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
                builder: (context) => CartPage(),
              ));
        } else if (state is HomeNavigateToWishListActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishlistPage(),
              ));
        }
      },
      builder: (context, state) {
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
        );
      },
    );
  }
}
