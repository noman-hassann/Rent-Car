import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rent_house/config/color.dart';
import 'package:rent_house/Apis/loginSignupApis/loginApis.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final myControllerEmail = TextEditingController();
final myControllerPassword = TextEditingController();
bool isloading = false;
bool _passwordVisible = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myControllerEmail.dispose();
      myControllerPassword.dispose();
      super.dispose();
    }

    bool validData() {
      if (!isEmail(myControllerEmail.text)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter Valid Email Address"),
          duration: Duration(milliseconds: 400),
        ));
        return false;
      }

      if (myControllerPassword.text.isNotEmpty &&
          myControllerPassword.text.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Valid Password"),
        ));
        return false;
      }

      return true;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      height: size.height,
                      // width: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              const AssetImage('assets/images/realEstate.jpg'),
                          fit: BoxFit.fitHeight,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.colorBurn),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: MediaQuery.of(context).viewInsets.bottom > 0
                            ? EdgeInsets.only(top: 90)
                            : EdgeInsets.only(top: 150),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * .9,
                              height: size.height * 0.5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(.8),
                                    ),
                                  ),
                                  // component(
                                  //   Icons.account_circle_outlined,
                                  //   'User name...',
                                  //   false,
                                  //   false,
                                  // ),
                                  component(
                                    icon: Icons.email_outlined,
                                    hintText: 'Email...',
                                    isPassword: false,
                                    isEmail: true,
                                    textediting: myControllerEmail,
                                  ),
                                  component(
                                      icon: Icons.lock_outline,
                                      hintText: 'Password...',
                                      isEmail: false,
                                      isPassword: true,
                                      textediting: myControllerPassword),
                                  Container(
                                    //  color: Colors.amberAccent,
                                    alignment: Alignment.topRight,
                                    width: size.width * .8,
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Forgotten password?',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            HapticFeedback.lightImpact();
                                            Fluttertoast.showToast(
                                              msg:
                                                  'Forgotten password! button pressed',
                                            );
                                          },
                                      ),
                                    ),
                                  ),
                                  //  SizedBox(height: size.width * .2),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        isloading = true;
                                      });

                                      if (validData() == true) {
                                        loginApis(
                                                email: myControllerEmail.text,
                                                password: myControllerPassword.text,
                                                context: context)
                                            .then((value) => {
                                                  setState(() {
                                                    isloading = false;
                                                  }),
                                                });
                                      } else {
                                        setState(() {
                                          isloading = false;
                                        });
                                      }
                                    },
                                    child: Container(
                                      //color: Colors.amber,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              bottom: size.width * .05,
                                            ),
                                            height: size.width / 8,
                                            width: size.width / 1.25,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: orange,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'Sing-In',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Create a new Account',
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.white,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.toNamed('signup');
                                                },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                isloading == true
                    ? Center(child: CircularProgressIndicator())
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget component({icon, hintText, isPassword, isEmail, textediting}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: textediting,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        //  controller: textediting,
        // obscureText: _passwordVisible,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          //  suffixIcon: IconButton(
          //   icon: Icon(
          //     // Based on passwordVisible state choose the icon
          //     _passwordVisible ? Icons.visibility : Icons.visibility_off,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {
          //     // Update the state i.e. toogle the state of passwordVisible variable
          //     setState(() {
          //       _passwordVisible = !_passwordVisible;
          //     });
          //   },
          // ),
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
