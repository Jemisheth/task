import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GeneralConfigController extends GetxController {
  double dheight = 0.0;
  double dwidth = 0.0;
  RxBool isLoaderActive = false.obs;

  final box = GetStorage();
}

GeneralConfigController generalConfigController = GeneralConfigController();
