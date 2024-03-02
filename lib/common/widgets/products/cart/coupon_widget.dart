import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class ShopCouponCode extends StatelessWidget {
  const ShopCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ShopHelperFunctions.isDarkMode(context);

    return ShopRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? ShopColors.dark : ShopColors.white,
      padding: const EdgeInsets.only(top: ShopSizes.sm, bottom: ShopSizes.sm, right: ShopSizes.sm, left: ShopSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none
              ),
            ),
          ),

          //button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? ShopColors.white.withOpacity(0.5) : ShopColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
