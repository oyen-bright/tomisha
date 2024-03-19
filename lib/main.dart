import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart' as rb;
import 'package:tomisha/theme/app_colors.dart';

import 'ui/views/home/home_view.dart';

void main() {
  rb.ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const rb.ScreenBreakpoints(
      desktop: 800,
      tablet: 700,
      watch: 200,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomisha Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tealColor),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
