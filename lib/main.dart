import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:umar_allure/page/menu_page.dart';
import 'package:umar_allure/routes/app_routes.dart';
import 'package:umar_allure/utils/size_config.dart';

/// Fungsi utama aplikasi Flutter.
Future<void> main() async {
  // Memastikan binding Flutter diinisialisasi.
  WidgetsFlutterBinding.ensureInitialized();

  // // Menginisialisasi Firebase.

  // // Mengatur orientasi layar yang diinginkan.
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const UmarAllureWarnaApps());
}

class UmarAllureWarnaApps extends StatelessWidget {
  const UmarAllureWarnaApps({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(AuthorizeController());

    // Menginisialisasi `SizeConfig` dengan konteks saat ini.
    SizeConfig().init(context);

    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: 'Umar Allure Warna App',
      debugShowCheckedModeBanner: false,

      // Membangun tata letak responsif berdasarkan breakpoint.
      builder: (BuildContext context, Widget? child) =>
          ResponsiveBreakpoints.builder(
            breakpoints: const <Breakpoint>[
              Breakpoint(start: 0, end: 480, name: MOBILE),
            ],
            child: child!,
          ),

      // Mengatur halaman awal aplikasi menjadi `AuthorizeView`.
      home: MenuPage(),

      // Mengatur rute aplikasi menggunakan `AppRoutes.routes`.
      getPages: AppRoutes.routes,

      // Mengatur transisi default menjadi `Transition.noTransition`.
      defaultTransition: Transition.noTransition,
    );
  }
}
