import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
    return ListTile(
      leading: const ShopCircularImage(
        image: ShopImages.darkAppLogo,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Akash Nishad', style: Theme.of(context).textTheme.headlineSmall!.apply(color: ShopColors.white)),
      subtitle: Text('akash@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: ShopColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: ShopColors.white,),),
    );
  }
}
