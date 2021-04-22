import 'package:coinhouse_app/modules/home/home_page.dart';
import 'package:coinhouse_app/modules/home/home_page_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final String initial = '/Home';

  static final routes = [
    GetPage(
      name: '/Home',
      page: () => HomePage(), //(uncomment here to swith to todo app)TodoList(),
      binding: HomePageBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
