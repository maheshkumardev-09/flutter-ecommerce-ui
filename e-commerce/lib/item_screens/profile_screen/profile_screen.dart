import 'dart:io';

import 'package:e_commerce_aap/item_screens/profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final box = GetStorage();
  final Map<String, dynamic> profileData = {
    'name': 'Mahesh Kumar',
    'email': 'kumarmahesh123mengh@gmail.com',
    'profileimage': 'images/profile.png',
  };
  String orderid = "4466379911";
  final List<Map<String, dynamic>> card = [
    {
      "image": "images/product 6.png",
      'name': 'IpadePro 2020 11",Wifi, 128GB',
      "staus": "Track Order",
    },
    {
      "image": "images/product 6.png",
      'name': 'IpadePro 2020 11",Wifi, 128GB',
      "staus": "Track Order",
    },
    {
      "image": "images/product 6.png",
      'name': 'IpadePro 2020 11",Wifi, 128GB',
      "staus": "Track Order",
    },
  ];
  bool notificationOn = true;
  @override
  void initState() {
    super.initState();
    final box = GetStorage();
    profileData['name'] = box.read('name') ?? 'mahesh kumar';
    // profileData['name'];
    profileData['email'] = box.read('email') ?? 'kumarmahesh123mengh@gmail.com';
    // profileData['email'];
    profileData['profileimage'] =
        box.read('profileimage') ?? 'image/profile.png';
    // profileData['profileimage'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              final updateData = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditProfileScreen(
                    name: profileData['name'],
                    email: profileData['email'],
                    profileimage: profileData['profileimage'],
                  ),
                ),
              );
              if (updateData != null) {
                final box = GetStorage();
                box.write('name', updateData['name']);
                box.write('email', updateData['email']);
                box.write('profileimage', updateData['profileimage']);
                setState(() {
                  profileData['name'] = updateData['name'];
                  profileData['email'] = updateData['email'];
                  profileData['profileimage'] = updateData['profileimage'];
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              height: 35.h,
              width: 35.w,
              child: Center(
                child: Image.asset(
                  'icon/useredit.png',
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: profileData["profileimage"].contains('/')
                    ?
                      // File(profileData["profileimage"]).existsSync()
                      FileImage(File(profileData["profileimage"]))
                    : AssetImage(profileData["profileimage"]),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              profileData["name"],
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Text(
              profileData["email"],
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    ' See All',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 8.0.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ID: $orderid',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "In Delivery",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade400, thickness: 2),
                  SizedBox(height: 5.h),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: card.length,
                    itemBuilder: (context, index) {
                      final item = card[index];
                      return ListTile(
                        leading: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.grey.shade300,
                          ),
                          child: Image.asset(
                            item["image"],
                            height: 34.h,
                            width: 31.h,
                          ),
                        ),
                        title: Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        trailing: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 1.w,
                            ),
                          ),
                          child: Text(item["staus"]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                children: [
                  _itemCard(() {}, 'icon/location.png', 'Address'),
                  Divider(color: Colors.grey.shade500),
                  _itemCard(() {}, "images/card.png", "Paymeent Mothod"),
                  Divider(color: Colors.grey.shade500),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset(
                        'icon/notification.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    title: Text(
                      "Notification",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: Switch(
                      activeThumbColor: Colors.white,
                      activeTrackColor: Colors.green,
                      value: notificationOn,
                      onChanged: (value) {
                        setState(() {
                          notificationOn = value;
                        });
                      },
                    ),
                  ),
                  Divider(color: Colors.grey.shade500),
                  _itemCard(() {}, "icon/security.png", "Account Scurity"),
                ],
              ),
            ),
            Divider(thickness: 2.h, color: Colors.grey),
            SizedBox(height: 10.h),
            Text(
              'General',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                children: [
                  _itemCard(() {}, 'icon/invitefriend.png', 'Invite Friends'),
                  Divider(color: Colors.grey.shade500),
                  _itemCard(() {}, "icon/language.png", "Language"),
                  Divider(color: Colors.grey.shade500),
                  _itemCard(() {}, "icon/privacy.png", "Privecy Policy"),
                  Divider(color: Colors.grey.shade500),
                  _itemCard(() {}, "icon/security.png", "Halp Center"),
                ],
              ),
            ),
            Divider(thickness: 2.h, color: Colors.grey),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.logout, color: Colors.red, size: 16.w),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemCard(VoidCallback tap, String image, String title) {
    return GestureDetector(
      onTap: tap,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24.r,
          backgroundColor: Colors.grey.shade200,
          child: Image.asset(image, width: 20, height: 20),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16.w),
      ),
    );
  }
}
