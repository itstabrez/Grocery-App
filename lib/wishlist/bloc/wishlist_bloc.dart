import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_groceryshop_bloc/data/wishlist_items.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishListInitialEvent>((event, emit) async {
      await wishlistInitialState(event, emit);
    });
    on<WishlistRemoveWishlistItemEvent>((event, emit) async {
      await wishlistRemoveWishlistItemEvent(event, emit);
    });
  }

  FutureOr<void> wishlistInitialState(
      WishListInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveWishlistItemEvent(
      WishlistRemoveWishlistItemEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistRemovedWishlistActionState());
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
