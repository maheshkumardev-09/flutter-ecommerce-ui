import 'package:e_commerce_aap/feature/home/home_screen.dart';
import 'package:e_commerce_aap/feature/onboarding/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'images/pickpay.png',
      title: 'PickPay',
      description: 'Welcome to PickPay!',
    ),
    OnboardingModel(
      image: 'images/shoppingbasket.png',
      title: 'Shopping Basket',
      description: 'Your shopping basket is ready!',
    ),
    OnboardingModel(
      image: 'images/securepaymet.png',
      title: 'Fast Delivery',
      description: 'Get your items delivered fast!',
    ),
  ];
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToNextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      HomeScreen();
    }
  }

  void skip() {
    Get.to(() => HomeScreen());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
