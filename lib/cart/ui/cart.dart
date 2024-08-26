import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceryshop_bloc/cart/bloc/cart_bloc.dart';
import 'package:flutter_groceryshop_bloc/cart/ui/cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cart"),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          bloc: cartBloc,
          listener: (context, state) {
            if (state is CartRemovedCartItemActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cart item removed")));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (CartSuccessState):
                final successState = state as CartSuccessState;
                return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc,
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
