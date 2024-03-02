import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_test_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class ShopHomeCategories extends StatelessWidget {
  const ShopHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ShopVerticalImageText(
              image: ShopImages.shoeIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => const SubCategoriesScreen()));
        },
      ),
    );
  }
}