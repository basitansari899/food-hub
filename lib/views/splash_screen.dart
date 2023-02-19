import 'package:flutter/material.dart';

import '../controllers/splash_controller.dart';
import '../utils/ui_data.dart';
import '../widgets/common_scaffold.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget bodyData() {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      UIDataImage.splash,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      bodyData: bodyData(),
    );
  }
}
