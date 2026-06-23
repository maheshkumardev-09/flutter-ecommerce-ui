import 'package:e_commerce_aap/getx/order_controller.dart';
import 'package:e_commerce_aap/item_screens/bottombar.dart';
import 'orderdetail_sccreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = Get.put(OrderController());

  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Macbook Pro 15” 2019 - Intel core i7",
      "price": 910,
      "oldPrice": 1029,
      "image": "images/product 1.png",
      "qty": 1,
      "selected": false,
    },
    {
      "name": "Apple AirPods (2nd Generation)",
      "price": 910,
      "oldPrice": 1029,
      "image": "images/product 4.png",
      "qty": 1,
      "selected": false,
    },
    {
      "name": "Ipad Pro 2020 11\", Wifi, 128GB",
      "price": 910,
      "oldPrice": 1029,
      "image": "images/product 6.png",
      "qty": 1,
      "selected": false,
    },
  ];
  final List<Map<String, dynamic>> related = [
    {
      "image": "images/product 6.png",
      "name": "Ipad Pro 2020 12\",Wifi,128GB",
      "price": 1029,
    },
    {
      "image": "images/product 5.png",
      "name": "Apple Mac Mini M1 Chip 2020",
      "price": 878,
    },
    {
      "image": "images/product 4.png",
      "name": "Apple AirPods (2nd Generation)",
      "price": 999,
    },
  ];

  int get selectedContent =>
      cartItems.where((e) => e["selected"] == true).length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty ? buildEmptyCart() : buildCart(),
    );
  }

  Widget buildCart() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.0.h,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: item["selected"],
                          activeColor: Colors.orange,
                          onChanged: (value) {
                            setState(() {
                              item["selected"] = value;
                            });
                          },
                        ),
                        Container(
                          height: 90.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              image: AssetImage(item["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["name"],
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${item["price"]}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "\$${item["oldPrice"]}",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  iconButton("-", () {
                                    setState(() {
                                      if (item["qty"] > 1) item["qty"]--;
                                    });
                                  }),
                                  SizedBox(width: 10.w),
                                  Text(
                                    item["qty"].toString(),
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(width: 10.w),
                                  iconButton("+", () {
                                    setState(() {
                                      item["qty"]++;
                                    });
                                  }),
                                  SizedBox(width: 30.w),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cartItems.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Product Related",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: related.length,
              itemBuilder: (context, index) {
                final p = related[index];
                return Container(
                  width: 120.w,
                  margin: EdgeInsets.only(left: 10.w),
                  // padding: EdgeInsets.only(left: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(p["image"], fit: BoxFit.cover),
                      ),
                      Text(
                        p["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "\$${p["price"]}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                final selectedItem = cartItems
                    .where((e) => e["selected"] == true)
                    .toList();
                controller.setOrderItems(selectedItem);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderdetailSccreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 22, 72),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Text(
                      selectedContent.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyCart() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('images/cart.png')),
          SizedBox(height: 20.h),
          Text(
            'Your cart is an empty!',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            "locks like you haven't added anything\nto your cart yet",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bottombar()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 14, 22, 72),
              ),
              child: Text(
                'Start Shopping',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Divider(thickness: 2.w, color: Colors.grey),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Products May you Like",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: related.length,
              itemBuilder: (context, index) {
                final p = related[index];
                return Container(
                  width: 120.w,
                  margin: EdgeInsets.only(left: 10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(p["image"], fit: BoxFit.cover),
                      ),
                      Text(
                        p["name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "\$${p["price"]}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButton(String text, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 26.h,
        width: 26.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          shape: BoxShape.circle,
        ),
        child: Text(text),
      ),
    );
  }
}
