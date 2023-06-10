import 'package:flutter/material.dart';
import 'package:kidsworld/screens/app.Container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  runApp(const AppScreen());
}