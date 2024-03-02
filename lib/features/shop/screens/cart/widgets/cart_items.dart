import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ShopCartItems extends StatelessWidget {
  const ShopCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
      const SizedBox(height: ShopSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const ShopCartItem(),
          if(showAddRemoveButton) const SizedBox(height: ShopSizes.spaceBtwItems),
          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  //add remove button
                  ShopProductQualityAddRemoveButton(),
                ],
              ),

              //product price
              ShopProductTitleText(title: '256')
            ],
          ),
        ],
      ),
    );
  }
}
