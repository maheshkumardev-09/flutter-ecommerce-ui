import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboredScreen2 extends StatefulWidget {
  const OnboredScreen2({super.key});

  @override
  State<OnboredScreen2> createState() => _OnboredScreen2State();
}

class _OnboredScreen2State extends State<OnboredScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 8.0.h,
              right: 8.0.w,
              child: TextButton(
                onPressed: () {},
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
              top: 0.15.sh,
              left: 20.w,
              child: Image.asset('images/shoppingbasket.png'),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 0.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Get those shopping\n bags filed",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Add any item you want to your cart or save\nit on your whishlist, so you don't miss it in\nyor future purchase.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 14, 22, 72),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
