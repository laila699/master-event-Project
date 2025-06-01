// lib/screens/vendor_dashboard/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/user.dart';
import '../../providers/auth_provider.dart';
import '../auth/login_screen.dart';
import 'offering_tab.dart';
import 'menu_tab.dart';

class VendorDashboardScreen extends ConsumerStatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  ConsumerState<VendorDashboardScreen> createState() =>
      _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends ConsumerState<VendorDashboardScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);

    // Redirect if not authenticated
    if (authState.status != AuthStatus.authenticated) {
      Future.microtask(() {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final User user = authState.user!;

    // Only “vendor” role can see this screen
    if (user.role != 'vendor' || user.vendorProfile == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('غير مصرح')),
        body: const Center(child: Text('هذه الصفحة مخصصة للبائعين فقط')),
      );
    }

    final serviceType = user.vendorProfile!.serviceType;
    final tabs = <Tab>[];
    final tabViews = <Widget>[];

    // 1) Every vendor gets an “Offerings” tab:
    tabs.add(const Tab(text: 'عروضك'));
    tabViews.add(const OfferingTab());

    // 2) If this vendor is a “restaurant”, add the menu tab
    if (serviceType == 'restaurant') {
      tabs.add(const Tab(text: 'قائمة الطعام'));
      tabViews.add(const MenuTab());
    }

    // Initialize TabController if needed
    _tabController ??= TabController(length: tabs.length, vsync: this);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('لوحة البائع: ${user.name}'),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'تسجيل الخروج',
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs:
                tabs
                    .map(
                      (t) => Tab(
                        child: Text(
                          t.text ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(controller: _tabController, children: tabViews),
      ),
    );
  }
}
