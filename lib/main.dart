import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsworld/screens/app.Container.dart';

import 'blocs/auth.Bloc.dart';
import 'firebase_options.dart';
import 'routers/app.Router.dart';
import 'routers/pages.Router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//  FirebaseMessaging.onMessage.listen((event) {showFlutterNotification(event);});
  // if (!kIsWeb) {
  //   await setupFlutterNotifications();
  //   if (kDebugMode) {
  //     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  //   } else {
  //     await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   }
  // }
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  Widget _buildAppScreen(){
    return GetMaterialApp(
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child??SizedBox(),
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
      initialRoute: AppRouter.staticAuth,
      getPages: AppPages.list,
      //initialBinding: AppBinding(),
    );
  }

  runApp(AppScreen(
    authBloc: AuthBloc(),
    child: _buildAppScreen(),
  ));
}