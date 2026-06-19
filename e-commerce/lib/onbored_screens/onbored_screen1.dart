import 'package:e_commerce_aap/onbored_screens/onbored_screen2.dart';
import 'package:e_commerce_aap/onbored_screens/onbored_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboredScreen1 extends StatefulWidget {
  const OnboredScreen1({super.key});

  @override
  State<OnboredScreen1> createState() => _OnboredScreen1State();
}

class _OnboredScreen1State extends State<OnboredScreen1> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          children: [
            Stack(
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
                  child: Image.asset('images/pickpay.png'),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(0, 0.6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Find the item you've \nbeen looking for",
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Here you'll see rich varities of goods,\nCarefully classified for seamless browsing\n experiene ",
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
            OnboredScreen2(),
            OnboredScreen3(),
          ],
        ),
      ),
    );
  }
}
