import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/personalization/controllers/update_name_controller.dart';
import 'package:shop/utils/constants/sizes.dart';
import 'package:shop/utils/constants/text_strings.dart';
import 'package:shop/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: ShopAppBar(title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(ShopSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text('Use real name for easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: ShopSizes.spaceBtwSections),

            //Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    validator: (value) => ShopValidator.validateEmptyText('First Name', value),
                    decoration: const InputDecoration(labelText: ShopTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: ShopSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => ShopValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: ShopTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),

                ],
              ),
            ),
            const SizedBox(height: ShopSizes.spaceBtwSections),

            //save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
