import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:memer_app/themes.dart";
import "package:memer_app/views/home_view.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Memer App',
      theme:
          ThemeData(useMaterial3: true, colorScheme: MyTheme.lightColorScheme),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: MyTheme.darkColorScheme,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      themeMode: ThemeMode.system,
      home: HomeView(),
    );
  }
}
