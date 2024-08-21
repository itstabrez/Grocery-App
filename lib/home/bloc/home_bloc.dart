import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>((event, emit) async {
      await homeInitialEvent()(event, emit);
    });
    on<HomeNavigateToCart>((event, emit) async {
      await homeNavigateToCart(event, emit);
    });
    on<HomeNavigateToWishList>((event, emit) async {
      await homeNavigateToWishList(event, emit);
    });
    FutureOr<void> homeInitialEvent(
        HomeInitialEvent event, Emitter<HomeState> emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 3));
      emit(HomeSuccessfullyLoadedState(products: products));
    }
  }

  FutureOr<void> homeNavigateToCart(
      HomeNavigateToCart event, Emitter<HomeState> emit) {
    print("Cart Clicked");
    emit(HomeNavigateToCartActionState());
  }

  FutureOr<void> homeNavigateToWishList(
      HomeNavigateToWishList event, Emitter<HomeState> emit) {
    print("WishList Clicked");
    emit(HomeNavigateToWishListActionState());
  }
}
