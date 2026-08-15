import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final double horizontalPadding = 50.0;
  final double horizontalMargin = 20.0;

  final int noOfIcons = 5;

  int selected = 0;

  final List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.qr_code_scanner,
    Icons.settings,
    Icons.person,
  ];

  final List<Color> colors = [
    Colors.blue.shade500,    // Home
    Colors.green.shade500,   // Search
    Colors.orange.shade500,  // Scan
    Colors.purple.shade500,  // Settings
    Colors.red.shade500,     // Profile
  ];

  late AnimationController controller;
  late Animation<double> animation;

  double position = 0.0;

  bool _initialized = false;

  @override
  void onInit() {
    super.onInit();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 375,
      ),
    );
  }

  double getEndPosition(
      BuildContext context,
      int index,
      ) {
    final double totalMargin =
        2 * horizontalMargin;

    final double totalPadding =
        2 * horizontalPadding;

    final double valueToOmit =
        totalMargin + totalPadding;

    final double availableWidth =
        MediaQuery.of(context).size.width -
            valueToOmit;

    final double itemWidth =
        availableWidth / noOfIcons;

    return (itemWidth * index +
        horizontalPadding) +
        (itemWidth / 2) -
        70;
  }

  void initialize(BuildContext context) {
    if (_initialized) {
      return;
    }

    position = getEndPosition(
      context,
      0,
    );

    animation = AlwaysStoppedAnimation<double>(
      position,
    );

    _initialized = true;
  }

  void selectItem(
      BuildContext context,
      int index,
      ) {
    if (selected == index) {
      return;
    }

    final double newPosition =
    getEndPosition(
      context,
      index,
    );

    animation = Tween<double>(
      begin: position,
      end: newPosition,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ),
    );

    position = newPosition;
    selected = index;

    controller.forward(from: 0);

    update();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}