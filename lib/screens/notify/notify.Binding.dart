import 'package:get/get.dart';
import 'notify.Controller.dart';

class NotifyBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>NotifyController());
  }
}