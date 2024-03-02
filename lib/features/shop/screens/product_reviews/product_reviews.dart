import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:shop/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-- AppBar
      appBar: const ShopAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ShopSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and are from people who use same type of device that you use."),
              const SizedBox(height: ShopSizes.spaceBtwItems),

              //Overflow product ratings
              const ShopOverallProductRating(),
              const ShopRatingBarIndicator(rating: 3.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ShopSizes.spaceBtwSections),

              //user reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),


      ),
    );
  }
}
