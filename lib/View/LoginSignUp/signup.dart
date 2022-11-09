import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:http/http.dart';

import 'package:rent_house/Conrtoller/loginSignupApis/SignupApis.dart';

import 'package:rent_house/widgets/widgets.dart';
import 'package:validators/validators.dart';

import '../../Config/color.dart';
import '../Navigation/navBar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

final myControllerName = TextEditingController();
final myControllerEmail = TextEditingController();
final myControllerContact = TextEditingController();
final myControllerAddress = TextEditingController();
final myControllerPassword = TextEditingController();

bool isloading = false;

class _SignupScreenState extends State<SignupScreen> {
  String _singleValue = "";
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myControllerName.dispose();
      myControllerEmail.dispose();
      myControllerContact.dispose();
      myControllerAddress.dispose();
      myControllerPassword.dispose();
      super.dispose();
    }

    bool validData() {
      if (myControllerName.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Your Name"),
          duration: Duration(milliseconds: 300),
        ));

        return false;
      }
      if (!isEmail(myControllerEmail.text)) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Enter Valid Email Address"),
          duration: Duration(milliseconds: 400),
        ));

        return false;
      }
      if (myControllerContact.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Phone Number"),
          duration: Duration(milliseconds: 300),
        ));
        return false;
      }
      if (myControllerAddress.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please enter Address"),
        ));
        return false;
      }
      if (myControllerPassword.text.isNotEmpty &&
          myControllerPassword.text.length < 6 ) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please Enter Valid Password"),
        ));
        return false;
      }
      return true;
    }

 

    Size size = MediaQuery.of(context).size;
    return Scaffold(
backgroundColor: Colors.white.withOpacity(0.6),
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
                              const AssetImage('assets/images/rental.jpg'),
                          fit: BoxFit.fitHeight,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: MediaQuery.of(context).viewInsets.bottom > 0
                            ? EdgeInsets.only(top: 10)
                            : EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * .9,
                              height: size.height * 0.8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 255, 255, 255)
                                          .withOpacity(.8),
                                    ),
                                  ),
                                  component(
                                    icon: Icons.person,
                                    hintText: 'Name...',
                                    isPassword: false,
                                    isEmail: false,
                                    textediting: myControllerName,
                                  ),
                                  component(
                                    icon: Icons.email_outlined,
                                    hintText: 'Email...',
                                    isPassword: false,
                                    isEmail: true,
                                    textediting: myControllerEmail,
                                  ),
                                  component(
                                    icon: Icons.phone,
                                    hintText: 'Contact...',
                                    isPassword: false,
                                    isEmail: false,
                                    textediting: myControllerContact,
                                  ),
                                  component(
                                    icon: Icons.location_on_outlined,
                                    hintText: 'Address...',
                                    isPassword: false,
                                    isEmail: false,
                                    textediting: myControllerAddress,
                                  ),

                                  component(
                                      icon: Icons.lock_outline,
                                      hintText: 'Password...',
                                      isEmail: false,
                                      isPassword: true,
                                      textediting: myControllerPassword),
                                  // Row(
                                  //   children: [
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(left: 25.0),
                                  //       child: text(
                                  //           title: "Sort :",
                                  //           fontsize: 17.0,
                                  //           color: Colors.white),
                                  //     ),
                                  //     RadioButton(
                                  //       description: "Agent",
                                  //       value: "Agent",
                                  //       textStyle:
                                  //           TextStyle(color: Colors.white),
                                  //       groupValue: _singleValue,
                                  //       onChanged: (value) => setState(
                                  //         () => _singleValue = value.toString(),
                                  //       ),
                                  //       activeColor: blue,
                                  //     ),
                                  //     RadioButton(
                                  //       description: "User",
                                  //       value: "User",
                                  //       textStyle:
                                  //           TextStyle(color: Colors.white),
                                  //       groupValue: _singleValue,
                                  //       onChanged: (value) => setState(
                                  //         () => _singleValue = value.toString(),
                                  //       ),
                                  //       activeColor: blue,
                                  //     ),
                                  //   ],
                                  // ),
                                
                                  //  SizedBox(height: size.width * .2),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                    Get.to(Navbar);
                                      // setState(() {
                                      //   isloading = true;
                                      // });
                                      // if (validData() == true) {
                                      //   signupApis(
                                      //           name: myControllerName.text,
                                      //           email: myControllerEmail.text,
                                      //           conatact:
                                      //               myControllerContact.text,
                                      //           address:
                                      //               myControllerAddress.text,
                                      //           password:
                                      //               myControllerPassword.text,
                                      //           type: _singleValue,
                                      //           context: context)
                                      //       .then((value) => {
                                      //             setState(() {
                                      //               isloading = false;
                                      //             }),
                                      //           });
                                      // } else {
                                      //   setState(() {
                                      //     isloading = false;
                                      //   });
                                      // }

                                      // print("Email:"+myControllerEmail.text);
                                      // print(myControllerEmail.text);
                                      // print("password:"+myControllerPassword.text);
                                      // print(myControllerPassword.text);
                                      HapticFeedback.lightImpact();
                                      // Fluttertoast.showToast(
                                      //   msg: 'Sign-In button pressed',
                                      // );
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
                                              color: blue,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'Sing Up',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Login',
                                              style: const TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.white,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Get.toNamed('login');
                                                  // Fluttertoast.showToast(
                                                  //   msg:
                                                  //       'Create a new Account button pressed',
                                                  // );
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
                            // Expanded(
                            //   child: SizedBox(),
                            // ),
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
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: textediting,

        textInputAction: TextInputAction.next,
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        //  controller: textediting,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,

        decoration: InputDecoration(
          // errorText: validateEmail(textediting.text),
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}


// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }
// }
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
