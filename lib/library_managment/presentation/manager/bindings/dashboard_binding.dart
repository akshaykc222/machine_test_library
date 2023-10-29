import 'package:get/get.dart';
import 'package:machine_test_library/injector.dart';
import 'package:machine_test_library/library_managment/presentation/manager/controller/dashboard_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(getIt(), getIt()));
  }
}
