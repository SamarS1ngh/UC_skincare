import 'package:UCskincare/Routes/app_router_config.dart';
import 'package:UCskincare/core/utils/app_constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'data/local/local_storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalStorageService.init();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: AppColorsTheme.light().bgInput),
            ),
            extensions: [
              AppColorsTheme.light(),
              AppTypography.main(),
              AppDimensionsTheme.main(View.of(context))
            ]),
      );
    });
  }
}
