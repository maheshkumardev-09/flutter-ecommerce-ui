import 'package:e_commerce_aap/entery_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool vispassword = true;
  bool vispassword2 = true;

  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(height: 12.h);
    var sizedBox2 = SizedBox(height: 8.h);
    final formKey = GlobalKey<FormState>();
    var sizedBox3 = SizedBox(height: 15.h);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confrompassword = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              sizedBox2,
              Text(
                'Create your new\naccount.',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              _title('Emali Address'),
              sizedBox2,
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(hintText: 'Emailaddress'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter email';
                  }
                  if (!value.contains('@')) {
                    return 'emailis is invalid';
                  }
                  return null;
                },
              ),
              sizedBox,
              _title('Password'),
              sizedBox2,
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                obscureText: vispassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        vispassword = !vispassword;
                      });
                    },
                    icon: Icon(
                      vispassword ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromARGB(255, 14, 22, 72),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  if (value.length != 11) {
                    return 'password must be 11';
                  }
                  return null;
                },
              ),
              sizedBox,
              _title('Confirm password'),
              sizedBox2,
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: confrompassword,
                obscureText: vispassword2,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        vispassword2 = !vispassword2;
                      });
                    },
                    icon: Icon(
                      vispassword2 ? Icons.visibility : Icons.visibility_off,
                      color: const Color.fromARGB(255, 14, 22, 72),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  if (value != password.text) {
                    return 'password is not match';
                  }
                  return null;
                },
              ),
              sizedBox3,
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 22, 72),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              sizedBox3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  Text(
                    'or continue with',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                ],
              ),
              sizedBox3,
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Colors.grey.shade500),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('images/google.png'),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Continue with google',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox,
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Colors.grey.shade500),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('images/facebook.png'),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        'Continue with facebook',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedBox3,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}
