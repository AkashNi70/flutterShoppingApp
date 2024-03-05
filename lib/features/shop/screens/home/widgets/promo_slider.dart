import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/shimmers/shimmer.dart';
import 'package:shop/features/shop/controllers/banner_controller.dart';
import 'package:shop/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/shop_rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';

class ShopPromoSlider extends StatelessWidget {
  const ShopPromoSlider({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        //loader
        if(controller.isLoading.value) return const ShopShimmerEffect(width: double.infinity, height: 190);

        //no data found
        if(controller.banners.isEmpty){
          return const Center(child: Text('No Data Found!'));
        }else{
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index)),
                  items: controller.banners.map((banner) => ShopRoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true, onPressed:() => Get.toNamed(banner.targetScreen),)).toList()
              ),
              const SizedBox(height: ShopSizes.spaceBtwItems),
              Center(
                child: Obx(
                      () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        ShopCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carousalCurrentIndex.value == i
                              ? ShopColors.primary
                              : ShopColors.grey,
                        )
                    ],
                  ),
                ),
              )
            ],
          );
        }
      }
    );
  }
}
