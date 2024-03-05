import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/common/widgets/shimmers/category_shimmer.dart';
import 'package:shop/features/shop/controllers/category_controller.dart';
import 'package:shop/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_test_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class ShopHomeCategories extends StatelessWidget {
  const ShopHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if(categoryController.isLoading.value) return const ShopCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center( child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return ShopVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()));
          },
        ),
      );
    });
  }
}