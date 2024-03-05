import 'package:get/get.dart';
import 'package:shop/data/repositories/categories/category_repository.dart';
import 'package:shop/features/shop/models/category_model.dart';
import 'package:shop/utils/popups/loaders.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async{
    try{
      //show loader while loading categories
      isLoading.value = true;

      //fetch categories from data source (Firestore, API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      //update the categories list
      allCategories.assignAll(categories);

      //filter featured list
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch (e){
      ShopLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      //remove loader
      isLoading.value = false;
    }
  }


  //load selected category data


  //get category or sub-category products



}