import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrowaseScreen extends StatefulWidget {
  const BrowaseScreen({super.key});

  @override
  State<BrowaseScreen> createState() => _BrowaseScreenState();
}

class _BrowaseScreenState extends State<BrowaseScreen> {
  int selectCategorite = 0;
  final List<Map<String, dynamic>> cartitems = [
    {
      'name': "Macbook Pro 2018\n15 - intel core i7",
      'price': "902",
      'oldprice': null,
      'image': "images/product 1.png",
      "tag": null,
    },
    {
      'name': "New True Wireless Streo Earbuds",
      'price': "465",
      'oldprice': null,
      'image': "images/product 2.png",
      "tag": 'new item',
    },
    {
      'name': "Sound White Wirelees Portable",
      'price': "240",
      'oldprice': null,
      'image': "images/product 3.png",
      "tag": 'out stock',
    },
    {
      'name': "Apple AirPods(2nd Generation)",
      'price': "108",
      'oldprice': null,
      'image': "images/product 4.png",
      "tag": null,
    },
    {
      'name': "Apple AirPods(2nd Generation)",
      'price': "108",
      'oldprice': null,
      'image': "images/product 4.png",
      "tag": null,
    },
    {
      'name': "New True Wireless Streo Earbuds",
      'price': "465",
      'oldprice': null,
      'image': "images/product 2.png",
      "tag": 'new item',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
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
              SizedBox(height: 20.h),
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
              Expanded(
                child: GridView.builder(
                  itemCount: cartitems.length,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (item["tag"] != null)
                            Positioned(
                              bottom: 7.h,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categorites(int index, String logo, String name) {
    bool selected = selectCategorite == index;
    return InkWell(
      onTap: () {
        setState(() => selectCategorite = index);
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

  // }
}
