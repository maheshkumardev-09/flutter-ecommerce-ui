import 'package:e_commerce_aap/getx/order_controller.dart';
import 'select_address_screen.dart';
import 'package:e_commerce_aap/item_screens/paymentm_methd_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderdetailSccreen extends StatefulWidget {
  const OrderdetailSccreen({super.key});

  @override
  State<OrderdetailSccreen> createState() => _OrderdetailSccreenState();
}

class _OrderdetailSccreenState extends State<OrderdetailSccreen> {
  final List<Map<String, dynamic>> addresses = [
    {
      "type": "Home",
      "address": "mirwarode jam laghari mirpurkhas ner lack city mirpurkhas,",
    },
    {"type": "Office", 'address': 'IpadePro 2020 11",Wifi, 128GB'},
    {"type": "Other", "address": "Custom Address Example"},
  ];
  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Obx(
          () => Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SelectAddressScreen());
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Image.asset(
                      controller.selecteAddress.value.icon,
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      controller.selecteAddress.value.type,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  controller.selecteAddress.value.fullAddress,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Divider(color: Colors.grey),
                Text(
                  'item',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ...controller.orderItems.map((item) {
                  return ListTile(
                    leading: Image.asset(item.image),
                    title: Text(item.title),
                    subtitle: Text(
                      '\$${item.price}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                    trailing: Text("X${item.qty}"),
                  );
                }).toList(),
                SizedBox(height: 10.h),
                Text(
                  'Shipping',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: EdgeInsets.all(8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/JT.png',
                            height: 30.h,
                            width: 44.w,
                          ),
                          Text(
                            "J&T Express",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.grey),
                      Column(
                        children: [
                          Text(
                            "Regular - \$10",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Estimate time01-03November',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Payment Summary",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text("\$${controller.totalePrice.toStringAsFixed(2)}"),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text("\$${controller.shippingFee.toStringAsFixed(2)}"),
                  ],
                ),
                Divider(color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payment",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      "\$${controller.totalePrice + controller.shippingFee}",
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: EdgeInsets.all(8.0.w),
                  child: ListTile(
                    leading: Image.asset(
                      controller.selectedPaymentMethod['icon'] ??
                          "images/card.png",
                      width: 32.w,
                      height: 32.h,
                    ),
                    title: Text(
                      controller.selectedPaymentMethod['name'] ?? "No Name",
                    ),
                    subtitle: Text(
                      controller.selectedPaymentMethod["number"] ?? "",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 25.w,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentmMethdScreen(),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 14, 22, 72),
                    ),
                    child: Text(
                      "Pay \$${(controller.totalePrice + controller.shippingFee).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
