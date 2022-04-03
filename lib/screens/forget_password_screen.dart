import 'package:e_book_shop/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFieldWidget(
            hintText: 'enter your email',
            labelText: 'email',
            icon: Icons.email,
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
