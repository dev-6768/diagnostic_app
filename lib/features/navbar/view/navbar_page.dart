import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/const/styles/app_colors.dart';
import 'package:diagnostic_app/features/home/view/home_page.dart';
import 'package:diagnostic_app/features/navbar/controller/pod/navbar_selected_index_pod.dart';
import 'package:diagnostic_app/features/pathology_test/view/pathology_test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

@RoutePage()
class NavbarPage extends StatelessWidget {
  const NavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavbarView();
  }
}

class NavbarView extends ConsumerStatefulWidget {
  const NavbarView({super.key});

  @override
  ConsumerState<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends ConsumerState<NavbarView> {
  List screen = [
    const HomePage(),
    const PathologyTestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final navbarSelectedIndexState = ref.watch(navbarSelectedIndexProvider);
        return Scaffold(
          body: PageView.builder(
            pageSnapping: false,
            itemCount: 1,
            itemBuilder: (context, index) {
              return screen[navbarSelectedIndexState];
            },
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: navbarSelectedIndexState,
            onDestinationSelected: (selectedIndex) {
              ref.read(navbarSelectedIndexProvider.notifier).update((state) => selectedIndex);
            },
            destinations: [
              //home
              NavigationDestination(
                icon: HugeIcon(
                  icon: Icons.home_outlined,
                  color: AppColors.kGrey500,
                  size: 20.0,
                ),
                selectedIcon: HugeIcon(
                  icon: Icons.home_outlined,
                  color: AppColors.kWhiteColor,
                  size: 25.0,
                ),
                label: 'Home',
              ),
              //pathology test
              NavigationDestination(
                icon: HugeIcon(
                  icon: Icons.medical_services_outlined,
                  color: AppColors.kGrey500,
                  size: 20.0,
                ),
                selectedIcon: HugeIcon(
                  icon: Icons.medical_services_outlined,
                  color: AppColors.kWhiteColor,
                  size: 25.0,
                ),
                label: 'Pathology test',
              ),
            ],
          ),
        );
      },
    );
  }
}
