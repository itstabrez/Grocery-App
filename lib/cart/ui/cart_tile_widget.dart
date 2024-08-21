// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_groceryshop_bloc/cart/bloc/cart_bloc.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';

class CartTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  CartBloc cartBloc = CartBloc();
  CartTile({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                productDataModel.imageUrl,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: 100,
              ),
              const SizedBox(
                  width: 8.0), // Add some spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDataModel.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productDataModel.description,
                      maxLines: 2,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Price: \$${productDataModel.price.toString()}'),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.favorite_border_outlined)),
                              IconButton(
                                  onPressed: () {
                                    cartBloc.add(CartRemoveCartItemsEvent(
                                        productDataModel: productDataModel));
                                  },
                                  icon: const Icon(Icons.shopping_bag))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
