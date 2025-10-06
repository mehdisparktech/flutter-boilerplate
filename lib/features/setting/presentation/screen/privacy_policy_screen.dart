import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../../core/component/other_widgets/common_loader.dart';
import '../../../../core/component/screen/error_screen.dart';
import '../../../../core/component/text/common_text.dart';
import '../controller/privacy_policy_controller.dart';
import '../../../../core/utils/constants/app_string.dart';
import '../../../../core/utils/enum/enum.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar Section stats here
      appBar: AppBar(
        centerTitle: true,
        title: const CommonText(
          text: AppString.privacyPolicy,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      /// Body Section stats here
      body: GetBuilder<PrivacyPolicyController>(
        builder:
            (controller) => switch (controller.status) {
              /// Loading bar here
              Status.loading => const CommonLoader(),

              /// Error Handle here
              Status.error => ErrorScreen(
                onTap: PrivacyPolicyController.instance.getPrivacyPolicyRepo(),
              ),

              /// Show main data here
              Status.completed => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 20,
                ),
                child: Html(data: controller.data.content),
              ),
            },
      ),
    );
  }
}
