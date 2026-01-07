import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String profileimage;
  const EditProfileScreen({
    super.key,
    required this.name,
    required this.email,
    required this.profileimage,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  // late TextEditingController phoneController;
  String phoneNaber = "";
  File? pickedImage;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    if (widget.profileimage.isNotEmpty && widget.profileimage.contains('/')) {
      pickedImage = File(widget.profileimage);
    }
    phoneNaber = '0333323248';
    // phoneController = TextEditingController(text: "0348 1231792");
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File tempImage = File(image.path);
      final appDir = await getApplicationDocumentsDirectory();
      final savedImage = await tempImage.copy(
        '${appDir.path}/profile_image.png',
      );
      final box = GetStorage();
      box.write('profileimage', savedImage.path);
      setState(() {
        pickedImage = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: pickedImage != null
                          ? FileImage(pickedImage!)
                          : (widget.profileimage.contains('/')
                                ? FileImage(File(widget.profileimage))
                                : AssetImage(widget.profileimage)
                                      as ImageProvider),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: pickImage,

                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(233, 33, 149, 244),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.edit_sharp, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              _label('Fullname'),
              SizedBox(height: 6.h),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Enter your name"),
              ),
              SizedBox(height: 12.h),
              _label('Date Birth'),
              SizedBox(height: 6.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter DOB",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_today_outlined),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              _label('Email Address'),
              SizedBox(height: 6.h),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter email'),
              ),
              SizedBox(height: 12.h),
              _label('Phone Number'),
              SizedBox(height: 6.h),
              IntlPhoneField(
                decoration: InputDecoration(hintText: '3024569012'),
                initialCountryCode: 'PK',
                showDropdownIcon: true,
                dropdownIconPosition: IconPosition.trailing,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (phone) {
                  setState(() {
                    phoneNaber = phone.completeNumber;
                  });
                },
                onCountryChanged: (country) {},
              ),
              SizedBox(height: 12.h),
              _label('Gender'),
              SizedBox(height: 6.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Gender',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      "name": nameController.text,
                      "email": emailController.text,
                      "profileimage": pickedImage?.path ?? widget.profileimage,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 14, 22, 72),
                  ),
                  child: Text(
                    'Save Change',
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
    );
  }

  Widget _label(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    );
  }
}
