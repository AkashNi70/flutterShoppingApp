import 'package:flutter/material.dart';

import 'curved_edges.dart';


class ShopCurvedEdgesWidget extends StatelessWidget {
  const ShopCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ShopCurvedEdges(),
      child: child,
    );
  }
}