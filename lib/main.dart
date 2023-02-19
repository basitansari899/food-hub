import 'package:flutter/material.dart';
import 'package:food_hub/utils/ui_data.dart';
import 'package:get/get.dart';
import 'utils/routes/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          // fontFamily: UIDataFonts.quickFont,
          primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Get.defaultTransition,
      showPerformanceOverlay: false,
      localizationsDelegates: [
        // const TranslationsDelegate(),
      ],
      enableLog: true,
      // logWriterCallback: Logger.write,
      // supportedLocales: [const Locale("en", "US")],
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}