import 'package:flutter/material.dart';
import 'package:shop/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class ShopOverallProductRating extends StatelessWidget {
  const ShopOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('4.8', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              ShopRatingProgressIndicator(text: '5', value: 1.0),
              ShopRatingProgressIndicator(text: '4', value: 0.8),
              ShopRatingProgressIndicator(text: '3', value: 0.6),
              ShopRatingProgressIndicator(text: '2', value: 0.4),
              ShopRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}

