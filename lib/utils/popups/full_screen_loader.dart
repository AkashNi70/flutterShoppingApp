import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/constants/colors.dart';
import 'package:shop/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';

class ShopFullScreenLoader{

  static void openLoadingDialog(String text, String animation)
  {
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => PopScope(
          canPop: false,
          child: Container(
            color: ShopHelperFunctions.isDarkMode(Get.context!) ? ShopColors.dark : ShopColors.white,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 250),
                ShopAnimationLoaderWidget(text: text, animation:animation),
              ],
            ),
          ),
        )
    );
  }

  //stop the currently open loading dialog
  //this method doesn't return anything.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }

}
