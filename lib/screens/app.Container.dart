import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../routers/app.Router.dart';
import '../routers/pages.Router.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          child: child??SizedBox(),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.prompt().fontFamily
      ),
      darkTheme: ThemeData.dark(),
      locale: Locale('vi', 'VN'),
      // initialRoute: AppRouter.welcome,
      initialRoute: AppRouter.main,
      getPages: AppPages.list,
      //initialBinding: AppBinding(),
    );
  }
}

