// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart'; // إضافة هذا لاستخدام GoogleFonts
import  'distribution_provider_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl, // تم تعديلها لـ RTL لمناسبتها للعربية
          child: child!,
        );
      },
      theme: ThemeData(
        fontFamily: GoogleFonts.cairo().fontFamily,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          centerTitle: true,
        ),
      ),
      // <== هنا نحدد الشاشة التي ستعمل عند تشغيل التطبيق
      home: DistributionProviderDashboardScreen(), // <== ستفتح هذه الصفحة مباشرةً
      // يمكنكِ تغيير 'زفاف' إلى أي نوع مناسبة آخر (مثل 'عيد ميلاد', 'مواليد')
      // لاختبار العروض المختلفة التي تظهر حسب نوع المناسبة.
    );
  }
}