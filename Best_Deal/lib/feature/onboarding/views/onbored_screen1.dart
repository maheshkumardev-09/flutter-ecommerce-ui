import 'package:e_commerce_aap/feature/onboarding/controllers/onboarding_controller.dart';
import 'package:e_commerce_aap/feature/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class OnboredScreen extends StatelessWidget {
  OnboredScreen({super.key});
  final OnboardingController controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          itemCount: controller.pages.length,
          itemBuilder: ((context, index) {
            return _buildPage(controller, controller.pages[index]);
          }),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingController controller, OnboardingModel page) {
    return Stack(
      children: [
        Positioned(
          top: 8.h,
          right: 8.w,
          child: TextButton(
            onPressed: () {
              controller.skip;
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.12.sh,
          left: 20.w,
          right: 20.w,
          child: Image.asset(page.image, height: 0.3.sh),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment(0, 0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  page.title,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15.h),
                Text(
                  page.description,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.h),
        GestureDetector(
          onTap: controller.goToNextPage,
          child: Obx(
            () => Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70.w,
                  height: 70.h,
                  child: CircularProgressIndicator(
                    value:
                        (controller.currentPage.value + 1) /
                        controller.pages.length,
                    backgroundColor: Colors.grey.shade300,
                    color: const Color.fromARGB(255, 14, 22, 72),
                    strokeWidth: 3,
                  ),
                ),
                Container(
                  width: 65.w,
                  height: 65.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 14, 22, 72),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
