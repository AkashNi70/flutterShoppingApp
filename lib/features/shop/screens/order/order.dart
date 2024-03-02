import 'package:flutter/material.dart';
import 'package:shop/common/widgets/appbar/appbar.dart';
import 'package:shop/features/shop/screens/order/widgets/orders_list.dart';
import 'package:shop/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(showBackArrow:true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(ShopSizes.defaultSpace),

        //orders
        child: ShopOrderListItems(),
      ),
    );
  }
}
