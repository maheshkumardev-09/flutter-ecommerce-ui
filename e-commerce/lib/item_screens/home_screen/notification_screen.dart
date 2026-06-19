import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
      title: "30% Special Discount!",
      subtitle: "Specail promotion only vaild today",
      image: 'images/discount.png',
      day: 'today',
    ),
    NotificationModel(
      title: "New Apple promotion",
      subtitle: "Specail promotion to all apple device",
      image: 'images/apple.png',
      day: 'today',
    ),
    NotificationModel(
      title: "Special offer! 40% OFF",
      subtitle: "Special offer for new account.unit 20 Nev 2024",
      image: 'images/discount.png',
      day: 'yesterday',
    ),
    NotificationModel(
      title: "Special offer! 50% OFF",
      subtitle: "Special offer for new account.unit 20 Nev 2024",
      image: 'images/discount.png',
      day: 'yesterday',
    ),
    NotificationModel(
      title: "Credit Card Connected",
      subtitle: "Special promotion only vaild today",
      image: 'images/card.png',
      day: 'yesterday',
    ),
    NotificationModel(
      title: "Account Setup Successfull!",
      subtitle: "Special promotion only vaild today",
      image: 'images/profilei.png',
      day: 'yesterday',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final todayList = notifications
        .where((element) => element.day == "today")
        .toList();
    final yesterdayList = notifications
        .where((element) => element.day == "yesterday")
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Notification',
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: todayList.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: index < todayList.length - 1
                        ? Border(
                            bottom: BorderSide(color: Colors.grey, width: 1.h),
                          )
                        : null,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset(
                        todayList[index].image,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                    title: Text(
                      todayList[index].title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      todayList[index].subtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Divider(color: Colors.grey, thickness: 3.h),
              SizedBox(height: 10.h),
              Text(
                'Yesterday',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: yesterdayList.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    border: index < yesterdayList.length - 1
                        ? Border(
                            bottom: BorderSide(color: Colors.grey, width: 1.h),
                          )
                        : null,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset(
                        yesterdayList[index].image,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                    title: Text(
                      yesterdayList[index].title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      yesterdayList[index].subtitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationModel {
  final String image;
  final String title;
  final String subtitle;
  final String day;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.day,
  });
}
