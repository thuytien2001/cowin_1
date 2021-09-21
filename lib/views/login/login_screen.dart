import 'dart:ffi';

import 'package:cowin_1/common/config/colors_config.dart';
import 'package:cowin_1/common/config/texts_config.dart';
import 'package:cowin_1/themes.dart';
import 'package:cowin_1/views/login/widgets/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../size_config.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/images/login.png'),
                SizedBox(
                  height: 26.h,
                ),
                Text(
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: kTextConfig.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(40),
                    color: cwColor1,
                  ),
                ),
                Text(
                  'Login to your account',
                  textAlign: TextAlign.center,
                  style: kTextConfig.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(20),
                    color: cwColor4,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: cwColor5,
                      ),
                      hintText: "Email/your number",
                      hintStyle: kTextConfig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(17),
                        color: cwColor5,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 17.h,
                ),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: cwColor5,
                      ),
                      hintText: "Password",
                      hintStyle: kTextConfig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(17),
                        color: cwColor5,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    //Image.asset('assets/images/tick.png'),
                    Text(
                      'Remember me',
                    ),
                    SizedBox(
                      width: 140.w,
                    ),
                    Text(
                      'Forgot password?',
                      style: kTextConfig.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14),
                        color: cwColor5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45.h,
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38),
                      color: cwColor5,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'LOGIN',
                      style: kTextConfig.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(20),
                        color: cwColor2,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: kTextConfig.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenUtil().setSp(18),
                        color: cwColor4,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        'Sign up!',
                        style: kTextConfig.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(18),
                          color: cwColor6,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
