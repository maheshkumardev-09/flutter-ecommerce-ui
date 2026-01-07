import 'package:e_commerce_aap/getx/order_controller.dart';
import 'package:e_commerce_aap/item_screens/addnewcard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentmMethdScreen extends StatefulWidget {
  const PaymentmMethdScreen({super.key});

  @override
  State<PaymentmMethdScreen> createState() => _PaymentmMethdScreenState();
}

class _PaymentmMethdScreenState extends State<PaymentmMethdScreen> {
  final controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Method',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(12),
                itemCount: controller.paymentMethods.length,
                itemBuilder: (context, index) {
                  var m = controller.paymentMethods[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            controller.selectedPaymentMethod['name'] ==
                                m["name"]
                            // controller.selectedPaymentMethod.value == m["name"]
                            ? Colors.blue
                            : Colors.grey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Image.asset(m["icon"].toString(), width: 40),
                      title: Text(m["name"].toString()),
                      subtitle: m["number"].toString().isNotEmpty
                          ? Text(m["number"].toString())
                          : null,
                      // trailing: controller.selectedPaymentMethod.value == m["name"]
                      //     ? Icon(Icons.check_circle, color: Colors.blue)
                      //     : Icon(Icons.circle_outlined),
                      onTap: () {
                        controller.updatePaymentMethod(m);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(AddnewcardScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 14, 22, 72),
                  ),
                  child: Text(
                    'Add New Payment',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
