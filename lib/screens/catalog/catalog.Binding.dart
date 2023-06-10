import 'package:get/get.dart';
import 'catalog.Controller.dart';

class CatalogBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>CatalogController());
  }
}