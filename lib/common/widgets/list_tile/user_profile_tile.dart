import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/shop_circular_image.dart';

class ShopUserProfileTile extends StatelessWidget {
  const ShopUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const ShopCircularImage(
        image: ShopImages.darkAppLogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: ShopColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ShopColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: ShopColors.white,),),
    );
  }
}
