import 'package:get/get.dart';
import 'package:umar_allure/page/menu_page.dart';
import 'package:umar_allure/routes/route_names.dart';


class AppRoutes {
  AppRoutes._();

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
        name: RoutesName.menuRoute,
        page: () => const MenuPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000)),
    
  ];
}