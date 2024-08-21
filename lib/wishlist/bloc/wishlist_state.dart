part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishListActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistRemovedWishlistActionState extends WishListActionState {}
