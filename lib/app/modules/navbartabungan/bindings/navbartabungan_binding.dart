import 'package:get/get.dart';
import 'package:siresma/app/modules/home/controllers/home_controller.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:siresma/app/modules/tabungan/controllers/tabungan_controller.dart';

import '../../setor/controllers/setor_controller.dart';
import '../controllers/navbarprofil_controller.dart';

class NavbarTabunganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarTabunganController>(
      () => NavbarTabunganController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfilController());
    Get.lazyPut(() => SetorController());
    Get.lazyPut(() => TabunganController());
  }
}
