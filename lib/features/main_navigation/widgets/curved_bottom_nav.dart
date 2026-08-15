import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import 'curved_nav_painter.dart';

class CurvedBottomNav extends StatelessWidget {
  const CurvedBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (controller) {
        controller.initialize(context);

        return Positioned(
          bottom: controller.horizontalMargin,
          left: controller.horizontalMargin,
          child: AnimatedBuilder(
            animation: controller.controller,
            builder: (context, child) {
              return CustomPaint(
                painter: CurvedNavPainter(
                  controller.animation.value,
                ),
                size: Size(
                  MediaQuery.of(context).size.width -
                      (2 * controller.horizontalMargin),
                  80.0,
                ),
                child: SizedBox(
                  height: 120.0,
                  width: MediaQuery.of(context).size.width -
                      (2 * controller.horizontalMargin),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: controller.horizontalPadding,
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: controller.icons
                          .asMap()
                          .entries
                          .map(
                            (entry) {
                          final int index = entry.key;
                          final IconData icon = entry.value;

                          final bool isSelected =
                              controller.selected == index;

                          return GestureDetector(
                            onTap: () {
                              controller.selectItem(
                                context,
                                index,
                              );
                            },
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 575,
                              ),
                              curve: Curves.easeOut,
                              height: 105.0,
                              width: 35.0,
                              padding: const EdgeInsets.only(
                                bottom: 17.5,
                                top: 22.5,
                              ),
                              alignment: isSelected
                                  ? Alignment.topCenter
                                  : Alignment.bottomCenter,
                              child: SizedBox(
                                height: 35.0,
                                width: 35.0,
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: const Duration(
                                      milliseconds: 375,
                                    ),
                                    switchInCurve:
                                    Curves.easeOut,
                                    switchOutCurve:
                                    Curves.easeOut,
                                    child: Icon(
                                      icon,
                                      key: ValueKey(
                                        '$index-$isSelected',
                                      ),
                                      size: 30.0,
                                      color: isSelected
                                          ? controller.colors[index]
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}