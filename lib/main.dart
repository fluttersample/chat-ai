import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/Helper/app_observer.dart';
import 'presentation/onboarding/ui/OnboardingView.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  BaseBrain.reloadDio();
  await BaseBrain.loadUserDataFromLocal();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        // maxWidth: Get.width,
        // minWidth: 450,
        // defaultScale: false,
        breakpoints: const [
           Breakpoint(start: 0, end: 450, name: MOBILE),
           Breakpoint(start: 451, end: 800, name: TABLET),
           Breakpoint(start: 801, end: 1920, name: DESKTOP),
           Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],

      ),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily
      ),

      home: const OnboardingView(),
    );
  }
}


