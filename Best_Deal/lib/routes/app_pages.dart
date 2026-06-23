import 'package:e_commerce_aap/feature/home/home_screen.dart';
import 'package:e_commerce_aap/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    //  GetPage(name: cart, page:() => CartScreen()),
  ];

  static const String initial = '/  initial';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String orderDetail = '/order-detail';
}
