import 'package:e_commerce_aap/feature/auth/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboredScreen3 extends StatefulWidget {
  const OnboredScreen3({super.key});

  @override
  State<OnboredScreen3> createState() => _OnboredScreen3State();
}

class _OnboredScreen3State extends State<OnboredScreen3> {
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
              child: Image.asset('images/securepaymet.png'),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment(0, 0.6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Fast & Secure\n Paymet",
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "There are many payment options available\nto speed up and simplify your payment\nprocess.  ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigmUpScreen(),
                          ),
                        );
                      },
                      child: Container(
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
