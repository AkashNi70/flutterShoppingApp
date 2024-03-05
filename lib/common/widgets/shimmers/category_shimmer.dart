import 'package:flutter/material.dart';
import 'package:shop/common/widgets/shimmers/shimmer.dart';
import 'package:shop/utils/constants/sizes.dart';

class ShopCategoryShimmer extends StatelessWidget {
  const ShopCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: ShopSizes.spaceBtwItems),
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              ShopShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: ShopSizes.spaceBtwItems / 2),

              //text
              ShopShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
