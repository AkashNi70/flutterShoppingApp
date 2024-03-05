import 'package:shop/utils/constants/image_strings.dart';

import '../../features/shop/models/banner_model.dart';

class ShopDummyData{
  //banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: ShopImages.promoBanner1, targetScreen: '', active: false),
  ];
}