import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Enterycompleted extends StatefulWidget {
  const Enterycompleted({super.key});

  @override
  State<Enterycompleted> createState() => _EnterycompletedState();
}

class _EnterycompletedState extends State<Enterycompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/success.png'),
            SizedBox(height: 100.h),
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
            SizedBox(height: 50.h),
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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
