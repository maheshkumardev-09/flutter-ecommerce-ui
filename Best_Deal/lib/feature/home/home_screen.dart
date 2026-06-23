import 'package:e_commerce_aap/feature/home/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedRating = 0;
  final List<Map<String, dynamic>> cartitems = [
    {
      'name': "Macbook Pro 2018\n15 - intel core i7",
      'price': "902",
      'oldprice': "1540",
      'image': "images/product 1.png",
      "tag": "50% off",
    },
    {
      'name': "New True Wireless Streo Earbuds",
      'price': "465",
      'oldprice': "573",
      'image': "images/product 2.png",
      "tag": 'new item',
    },
    {
      'name': "Sound White Wirelees Portable",
      'price': "240",
      'oldprice': "540",
      'image': "images/product 3.png",
      "tag": 'out stock',
    },
    {
      'name': "Apple AirPods(2nd Generation)",
      'price': "108",
      'oldprice': "130",
      'image': "images/product 4.png",
      "tag": null,
    },
    {
      'name': "Apple AirPods(2nd Generation)",
      'price': "130",
      'oldprice': "300",
      'image': "images/product 5.png",
      "tag": "30% off",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              width: double.infinity,
              color: const Color.fromARGB(255, 70, 23, 152),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: AssetImage('images/profile.png'),
                        ),
                        SizedBox(width: 100.w),
                        CircleAvatar(
                          foregroundColor: Colors.transparent,
                          radius: 18.r,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          foregroundColor: Colors.transparent,
                          radius: 18.r,
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationScreen(),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            foregroundColor: Colors.transparent,
                            radius: 18.r,
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Find Best device for\nYour setup!',
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'search laptop headset, ets...',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hot deals🔥',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                '03',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                '13',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              ':',
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Text(
                                '00',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _itemBox(
                            'images/product 1.png',
                            "Macbook Pro 2018\n15 - intel core i7",
                            "\$1240",
                            "\$540",
                          ),
                          SizedBox(width: 5.w),
                          _itemBox(
                            'images/product 2.png',
                            "New true Wireless\nStereo Earbuds",
                            "\$462",
                            "\$575",
                          ),
                          SizedBox(width: 5.w),
                          _itemBox(
                            'images/product 3.png',
                            "Sound White\nWireless portable",
                            "\$240",
                            "\$540",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _categorites(0, 'images/categories.png', 'All'),
                          SizedBox(width: 5.w),
                          _categorites(1, 'images/laptop.png', 'Laptop'),
                          SizedBox(width: 5.w),
                          _categorites(2, 'images/earphone.png', 'Accessories'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    GridView.builder(
                      itemCount: cartitems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemBuilder: (context, index) {
                        final item = cartitems[index];
                        return SizedBox(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                height: 220.h,
                                width: 160.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 120.h,
                                      width: 130.w,
                                      child: Image.asset(
                                        item['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "\$${item["price"]}",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        if (item["oldprice"] != null)
                                          Text(
                                            "\$${item["oldprice"]}",
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (item["tag"] != null)
                                Positioned(
                                  bottom: -3.h,
                                  left: 20.w,
                                  right: 20.w,
                                  child: Container(
                                    width: 85.w,
                                    height: 21.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: item["tag"] == "out stock"
                                          ? Colors.grey.shade300
                                          : Colors.orange,
                                    ),
                                    child: Text(
                                      item['tag'],
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
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

  Widget _itemBox(String item, String name, String price, String realPrice) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 180.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130.h,
            width: 150.w,
            child: Image.asset(item, fit: BoxFit.cover),
          ),
          SizedBox(height: 5.h),
          Text(
            textAlign: TextAlign.left,
            name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    realPrice,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 14, 22, 72),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _categorites(int index, String logo, String name) {
    bool selected = selectedRating == index;
    return InkWell(
      onTap: () {
        setState(() => selectedRating = index);
      },
      child: Container(
        height: 40.h,
        padding: EdgeInsets.only(right: 20.w, top: 4.h, bottom: 4.h, left: 4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: selected
              ? Color.fromARGB(255, 14, 22, 72)
              : Colors.grey.shade100,
          border: Border.all(
            color: selected
                ? Color.fromARGB(255, 14, 22, 72)
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(radius: 15.r, backgroundImage: AssetImage(logo)),
            SizedBox(width: 5.w),
            Text(
              name,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
