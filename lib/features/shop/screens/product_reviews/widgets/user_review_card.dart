import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shop/common/widgets/products/ratings/rating_indicator.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/image_strings.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(ShopImages.user)),
                const SizedBox(width: ShopSizes.spaceBtwItems),
                Text('Akash Nishad',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems),
        
        //Review
        Row(
          children: [
            const ShopRatingBarIndicator(rating: 4),
            const SizedBox(width: ShopSizes.spaceBtwItems),
            Text('28 Feb, 2024',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ShopColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ShopColors.primary),
        ),
        const SizedBox(height: ShopSizes.spaceBtwItems),

        //company review
        ShopRoundedContainer(
          backgroundColor: dark ? ShopColors.darkerGrey : ShopColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(ShopSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('28 Feb, 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: ShopSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ShopColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ShopColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: ShopSizes.spaceBtwSections),
      ],
    );
  }
}
