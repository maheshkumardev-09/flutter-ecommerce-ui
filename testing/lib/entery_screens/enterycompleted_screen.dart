import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterycompletedScreen extends StatefulWidget {
  const EnterycompletedScreen({super.key});

  @override
  State<EnterycompletedScreen> createState() => _EnterycompletedScreenState();
}

class _EnterycompletedScreenState extends State<EnterycompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),

      child: Column(
        children: [
          Expanded(child: Image.asset('images/success.png')),
          Text(
            'Congratulations!',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Text(
            ' your account is ready to use, you will be redirected\nto the Homepage in a few secends ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 14, 22, 72),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
