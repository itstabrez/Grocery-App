part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavigateToCart extends HomeEvent {}

class HomeNavigateToWishList extends HomeEvent {}

class HomeAddToCart extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeAddToCart({required this.clickedProduct});
}

class HomeAddToWishList extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeAddToWishList({required this.clickedProduct});
}
