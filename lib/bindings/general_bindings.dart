import 'package:get/get.dart';
import 'package:shop/utils/network/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(NetworkManger());
  }
}