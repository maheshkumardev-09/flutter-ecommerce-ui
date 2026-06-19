import 'package:e_commerce_aap/entery_screens/forgetpsssword_screen.dart';
import 'package:e_commerce_aap/entery_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _showFrgetshet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.5.h,
          child: ForgetPssswordScreen(),
        );
      },
    );
  }

  bool vispassword = true;
  @override
  Widget build(BuildContext context) {
    var sizedBox = SizedBox(height: 12.h);
    var sizedBox2 = SizedBox(height: 8.h);
    final formKey = GlobalKey<FormState>();
    var sizedBox3 = SizedBox(height: 15.h);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              sizedBox2,
              Text(
                'Login to your \naccount.',
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
              sizedBox3,
              TextButton(
                onPressed: () {
                  _showFrgetshet(context);
                },
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
                    'Login',
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
                        radius: 23,
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
                    "Don't have an accout?",
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
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Register',
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
