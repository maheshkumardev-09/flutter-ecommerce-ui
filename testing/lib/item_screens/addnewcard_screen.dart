import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddnewcardScreen extends StatelessWidget {
  const AddnewcardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Card',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        'images/atmcard.png',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.height * 0.9,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Card Holder Name',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  TextFormField(
                    decoration: InputDecoration(hint: Text('Select time')),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Card Number',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hint: Text('Select time')),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expiry Date',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              decoration: InputDecoration(
                                hint: Text('Select Date'),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hint: Text('Enter CVV'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 14, 22, 72),
                ),
                child: Text(
                  "AddPayment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
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
