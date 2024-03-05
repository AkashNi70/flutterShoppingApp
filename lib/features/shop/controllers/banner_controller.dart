import 'package:get/get.dart';
import 'package:shop/data/repositories/banners/banner_repository.dart';
import 'package:shop/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{


  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index){
    carousalCurrentIndex.value = index;
  }

  //fetch banners
  //load category data
  Future<void> fetchBanners() async{
    try{
      //show loader while loading categories
      isLoading.value = true;

      //fetch banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners
      this.banners.assignAll(banners);

    }catch (e){
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      //remove loader
      isLoading.value = false;
    }
  }
}