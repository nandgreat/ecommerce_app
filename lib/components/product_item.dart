import 'package:ecommerce_app/configs/routes_contants.dart';
import 'package:ecommerce_app/models/products/DummyProductsResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../models/products/AnotherFakeApiProduct.dart';
import '../models/products/FakeApiProducts.dart';
import '../models/products/Product.dart';
import '../utils/helpers.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.index,
    required this.product,
    this.backgroundColor,
    this.bottomSpace, required this.onPress,
  }) : super(key: key);

  final int index;
  final Products product;
  final double? bottomSpace;
  final Color? backgroundColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
      child: InkWell(
        onTap: onPress,
        child: Hero(
          tag: product.id!,
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 250,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 1.0),
                          image: DecorationImage(
                              image: NetworkImage(product.thumbnail!.replaceFirst("[\"", "").replaceFirst("\"]", "") ?? ""),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top:13.0, left: 10, right:10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product.title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14.0, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product.description ?? "",
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12.0, fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  formatMoney(product.price!),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 14.0, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                ignoreGestures: true,
                                itemCount: 5,
                                itemSize: 14,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
