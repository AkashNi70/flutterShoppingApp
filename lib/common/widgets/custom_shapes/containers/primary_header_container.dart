import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class ShopPrimaryHeaderContainer extends StatelessWidget {
  const ShopPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShopCurvedEdgesWidget(
      child: Container(
        color: ShopColors.primary,

        child: Stack(
          children: [
            Positioned(top: -150, right: -250 , child: ShopCircularContainer(backgroundColor: ShopColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300 , child: ShopCircularContainer(backgroundColor: ShopColors.textWhite.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}

