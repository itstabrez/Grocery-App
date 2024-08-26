import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryshop_bloc/data/cart_items.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>((event, emit) async {
      await cartInitialEvent(event, emit);
    });
    on<CartRemoveCartItemsEvent>((event, emit) async {
      await cartRemoveCartItemsEvent(event, emit);
    });
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveCartItemsEvent(
      CartRemoveCartItemsEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(CartRemovedCartItemActionState());
    emit(CartSuccessState(cartItems: cartItems));
  }
}
