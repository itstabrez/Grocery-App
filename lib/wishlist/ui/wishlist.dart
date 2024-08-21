import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceryshop_bloc/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_groceryshop_bloc/wishlist/ui/wishlist_tiles_widget.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Wishlists"),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishListActionState,
          buildWhen: (previous, current) => current is! WishListActionState,
          listener: (context, state) {
            if (state is WishlistRemovedWishlistActionState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Item removed from your wishlist")));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (WishlistSuccessState):
                final successState = state as WishlistSuccessState;
                return ListView.builder(
                  itemCount: successState.wishlistItems.length,
                  itemBuilder: (context, index) {
                    return WishlistTilesWidget(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                    );
                  },
                );

              default:
                return const SizedBox();
            }
          },
        ));
  }
}
