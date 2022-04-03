import 'package:e_book_shop/dimensions.dart';
import 'package:e_book_shop/screens/sign_in_screen.dart';
import 'package:e_book_shop/widgets/rounded_button.dart';
import 'package:e_book_shop/widgets/textfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var nameController = TextEditingController();
    String? _password = passwordController.text;
    String _confirmPassword = confirmPasswordController.text;
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    var signUpImages = [
      'f.png',
      't.png',
      'g.png',
    ];

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
              //this text field for the the name
              TextFieldWidget(
                textController: nameController,
                hintText: 'Name',
                labelText: 'Name',
                icon: Icons.person,
                iconColor: Colors.red,
                obscureText: false,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              //this text field for the email
              TextFieldWidget(
                textController: emailController,
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
                height: Dimensions.height10,
              ),
              //this text field for the confirm password
              TextFieldWidget(
                onchange: (value) {
                  _confirmPassword = value;
                  // print('confirmPassword: $confirmPassword');
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'required';
                  } else if (_confirmPassword != _password) {
                    return 'password not match';
                  } else {
                    return null;
                  }
                },
                textController: confirmPasswordController,
                hintText: 'confirm password',
                labelText: 'confirm password',
                icon: Icons.password_sharp,
                iconColor: Colors.red,
                obscureText: true,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              //this is sign up button
              RoundedButton(
                onPressed: () {
                  globalKey.currentState!.validate();
                },
                title: 'SignUp',
                colour: Colors.red,
              ),

              SizedBox(
                height: Dimensions.height20,
              ),
              //have an account already
              RichText(
                text: TextSpan(
                    text: 'already have an account?',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20 / 1.2,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(SignInScreen()),
                        text: 'Sign in',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //Sign up methods
              RichText(
                text: TextSpan(
                    text: 'SignUp using one of the methods',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font15,
                    )),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              //sign up icon
              Wrap(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.all(Dimensions.width10),
                    child: CircleAvatar(
                      radius: Dimensions.radius30,
                      backgroundImage: AssetImage(
                        'assets/images/' + signUpImages[index],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
