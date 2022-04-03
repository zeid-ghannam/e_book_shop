import 'package:e_book_shop/dimensions.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
 const RoundedButton({
    Key? key,
    this.colour,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final Color? colour;
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        //this button for going to the login screen
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: Dimensions.width25*10,
          height: Dimensions.height45,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.font20,
            ),
          ),
        ),
      ),
    );
  }
}
