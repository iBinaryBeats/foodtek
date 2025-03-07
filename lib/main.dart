import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/features/onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:foodtek/features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const FoodTek());
  /*runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => FoodTek()),
  );

   */
}

class FoodTek extends StatelessWidget {
  const FoodTek({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Inter'),
            bodyMedium: TextStyle(fontFamily: 'Inter'),
            bodySmall: TextStyle(fontFamily: 'Inter'),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
