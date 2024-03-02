import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/constants/sizes.dart';

class ShopAnimationLoaderWidget extends StatelessWidget {
  const ShopAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionNext,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionNext;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          const SizedBox(height: ShopSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ShopSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: ShopColors.dark),
                    child: Text(
                      actionNext!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: ShopColors.light),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
