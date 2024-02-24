import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../res/color_palette.dart';
import '../utils/helpers.dart';

class CartItemWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final String? rating;
  final String? amount;
  final String? total;
  final String? quantity;
  final VoidCallback onRemovePress;

  const CartItemWidget({Key? key, this.title, this.image, this.rating, this.amount, this.total, this.quantity, required this.onRemovePress })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Row(children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image:  DecorationImage(
                            image: NetworkImage(
                                image!))),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: onRemovePress,
                                            child: Icon(CupertinoIcons.multiply)),
                                      ],
                                    ),
                                     Text(
                                      title!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 4,),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "4.6",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          ignoreGestures: true,
                                          itemSize: 17,
                                          itemPadding: const EdgeInsets.only(
                                              right: 1.0),
                                          itemBuilder: (context, _) =>
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                        "Qty: $quantity",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey.shade300, width: 1.0, ),
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      child: Text(
                                        formatMoney(double.parse(amount!)),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ]),
                const Divider(
                  height: 20,
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                          "Total Order",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600)),
                      Text(
                          "\$$total",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
