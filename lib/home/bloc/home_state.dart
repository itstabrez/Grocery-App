part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessfullyLoadedState extends HomeState {
  final List<ProductDataModel> products;

  HomeSuccessfullyLoadedState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}
