import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';


class ShopHomeAppBar extends StatelessWidget {
  const ShopHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ShopAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ShopTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: ShopColors.grey)),
          Text(ShopTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: ShopColors.white)),
        ],
      ),
      actions: [
        ShopCounterIcon(onPressed: () {}, iconColor: ShopColors.white),
      ],
    );
  }
}