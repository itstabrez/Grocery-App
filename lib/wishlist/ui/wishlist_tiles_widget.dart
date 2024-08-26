// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_groceryshop_bloc/home/models/home_product_data_model.dart';
import 'package:flutter_groceryshop_bloc/wishlist/bloc/wishlist_bloc.dart';

class WishlistTilesWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  WishlistBloc wishlistBloc = WishlistBloc();
  WishlistTilesWidget({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
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
                                  onPressed: () {
                                    wishlistBloc.add(
                                        WishlistRemoveWishlistItemEvent(
                                            productDataModel:
                                                productDataModel));
                                  },
                                  icon: const Icon(Icons.favorite)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.shopping_bag_outlined))
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
