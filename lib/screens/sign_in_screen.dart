import 'package:e_book_shop/screens/forget_password_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../dimensions.dart';
import '../widgets/rounded_button.dart';
import '../widgets/textfieldwidget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    String? _email;
    String? _password;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight * 0.05),
             //this container hold the image logo like circle avatar
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage:
                    AssetImage('assets/images/logo part 1.png'),
                  ),
                ),
              ),
              //this is for the rest of the page
              Column(
                children: [
                  SizedBox(height: Dimensions.screenHeight * 0.1),
                  //this text field for the email
                  TextFieldWidget(
                    onchange: (value) {
                      _email = value;
                    },
                    hintText: 'name@example.com',
                    labelText: 'Email',
                    icon: Icons.email,
                    iconColor: Colors.red,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  //this text field for the password
                  TextFieldWidget(
                    onchange: (value) {
                      _password = value;
                      // print('password: $password');
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'required';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'password',
                    labelText: 'password',
                    icon: Icons.lock,
                    iconColor: Colors.red,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(right: Dimensions.width30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(
                              ForgetPassword(),
                            ),
                          text: 'Forget password',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: Dimensions.font15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  // this button for the sign in
                  RoundedButton(
                    onPressed: () {
                      globalKey.currentState!.validate();
                    },
                    title: 'Sign In',
                    colour: Colors.red,
                  ),

                  SizedBox(
                    height: Dimensions.height20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
