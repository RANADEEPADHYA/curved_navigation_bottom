import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import '../widgets/curved_bottom_nav.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        builder: (controller) {
          return AnimatedContainer(
            duration: const Duration(
              milliseconds: 375,
            ),
            curve: Curves.easeOut,
            color: controller.colors[controller.selected],
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Selected Index: ${controller.selected}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const CurvedBottomNav(),
              ],
            ),
          );
        },
      ),
    );
  }
}