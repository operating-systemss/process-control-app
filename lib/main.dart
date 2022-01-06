import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'core/init/cache/get_storage_manager.dart';
import 'core/init/routes/app_pages.dart';
import 'core/init/theme/app_theme_light.dart';
import 'features/process/view/process_view.dart';

void main() async {
  await _init();

  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocaleManager.prefrencesInit();
  await SystemChannels.textInput.invokeMethod('TextInput.hide');

  //BookingCarList.instance;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'System Monitor',
          getPages: AppPages.appPages,
          defaultTransition: Transition.native,
          theme: ThemeData(),
          home: ProcessView(),
        );
      },
    );
  }
}
