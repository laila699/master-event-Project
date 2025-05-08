import 'package:flutter/material.dart';
import 'InvitationScreen.dart';
import 'user_profile.dart';
import 'add_event_screen.dart';
import 'design.dart';
import 'furniture.dart';
import 'EventSettingsPage.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Cairo',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      locale: const Locale('ar', ''),

      home: const Main(userName: "Laila"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatelessWidget {
  final String userName;

  const Main({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("مرحبًا، $userName 👋"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'الإشعارات',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("صفحة الإشعارات قيد الإنشاء!")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            tooltip: 'الدردشات',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("صفحة الدردشات قيد الإنشاء!")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'الملف الشخصي',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userName: userName),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "📆 مناسباتك القادمة",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
 
             Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: const Icon(Icons.card_giftcard, color: Colors.purple),
                title: const Text('دعوة لحفل زفاف'),
                subtitle: const Text('📅 15 أبريل 2024 | 📍 قاعة الماس'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("سيتم فتح تفاصيل الدعوة قريباً!"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                leading: const Icon(Icons.event, color: Colors.purple),
                title: const Text('عيد ميلاد سعيد'),
                subtitle: const Text('📅 20 مايو 2024 | 📍 مطعم روزيلا'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("سيتم فتح تفاصيل الدعوة قريباً!"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "🎉 اكتشف خدمات المناسبات",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ServiceCard(
                    icon: Icons.celebration,
                    title: "الديكورات",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DesignScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.email,
                    title: "الدعوات الإلكترونية",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvitationScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.card_giftcard,
                    title: "التوزيعات والهدايا",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("قسم الهدايا قيد الإنشاء!"),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.chair,
                    title: "الأثاث",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FurnitureScreen(),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.menu_book,
                    title: "إدارة الفعالية",
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  EventSettingsPage(), 
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.tv,
                    title: "الترفيه والعروض",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("قسم الترفيه قيد الإنشاء!"),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.camera_alt,
                    title: "التصوير والفيديو",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("قسم التصوير قيد الإنشاء!"),
                        ),
                      );
                    },
                  ),
                  ServiceCard(
                    icon: Icons.more_horiz,
                    title: " قوائم الطعام",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("المزيد من الخدمات قريباً!"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEventScreen()),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("إضافة مناسبة جديدة"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
    );
  }
}

// --- ويدجت بطاقة الخدمة ---
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? onTap;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


