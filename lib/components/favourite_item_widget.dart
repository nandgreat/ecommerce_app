import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../res/color_palette.dart';
import '../utils/helpers.dart';

class FavouriteItemWidget extends StatelessWidget {
  final String? title;
  final String? image;
  final String? rating;
  final String? amount;
  final VoidCallback onRemovePress;
  final VoidCallback onAddToCartPress;

  const FavouriteItemWidget({Key? key, this.title, this.image, this.rating, this.amount, required this.onRemovePress, required this.onAddToCartPress })
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
                            image: CachedNetworkImageProvider(
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
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4,),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        const Text(
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
                              SizedBox(height: 8,),
                              InkWell(
                                onTap: onAddToCartPress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                                    child: Text("Add to Cart", style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
