part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishListInitialEvent extends WishlistEvent {}

class WishlistRemoveWishlistItemEvent extends WishlistEvent {
  final ProductDataModel productDataModel;

  WishlistRemoveWishlistItemEvent({required this.productDataModel});
}
