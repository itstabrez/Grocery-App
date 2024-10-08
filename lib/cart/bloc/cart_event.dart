part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveCartItemsEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveCartItemsEvent({required this.productDataModel});
}
