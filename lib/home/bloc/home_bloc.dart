import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_groceryshop_bloc/data/cart_items.dart';
import 'package:flutter_groceryshop_bloc/data/grocery_data.dart';
import 'package:flutter_groceryshop_bloc/data/wishlist_items.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      await homeInitialEvent(event, emit);
    });
    on<HomeNavigateToCart>((event, emit) async {
      await homeNavigateToCart(event, emit);
    });
    on<HomeNavigateToWishList>((event, emit) async {
      await homeNavigateToWishList(event, emit);
    });
    on<HomeAddToCart>((event, emit) async {
      await homeAddToCart(event, emit);
    });
    on<HomeAddToWishList>((event, emit) async {
      await homeAddToWishList(event, emit);
    });
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeSuccessfullyLoadedState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl'],
              ),
            )
            .toList(),
      ),
    );
  }

  FutureOr<void> homeNavigateToCart(
      HomeNavigateToCart event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeNavigateToWishList(
      HomeNavigateToWishList event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishListActionState());
  }

  FutureOr<void> homeAddToCart(HomeAddToCart event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    print("Clicked Cart");
    emit(HomeItemCartedActiontate());
  }

  FutureOr<void> homeAddToWishList(
      HomeAddToWishList event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeItemWishListedActionState());
    print("Clicked wishlist");
  }
}
