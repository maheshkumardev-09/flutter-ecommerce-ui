import 'package:e_commerce_aap/entery_screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPssswordScreen extends StatelessWidget {
  const ForgetPssswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: ListView(
        children: [
          Text(
            'Forget password',
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            ' Select which contact details should we use to \n rest your password',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'send via WhatssApp',
              prefixIcon: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: const Color.fromARGB(255, 14, 22, 72),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'send vis Email',
              prefixIcon: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.envelope,
                  color: const Color.fromARGB(255, 14, 22, 72),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
              },
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
          // SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
