import 'package:api_app/SpecialClasses/SpecialClasses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget buildLabel(String text, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Text(
        text,
        style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, IconData icon, double screenWidth, double screenHeight, int maxLength) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.007),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        inputFormatters: [ NoSpaceFormatter() ,FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZüöÇŞİşçÜÖĞğ" "]'))],
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
          hintText: 'Search...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }

  Widget buildResultExpansion(String text, double screenWidth){
    return Text(text,
      style: TextStyle(fontSize: screenWidth * 0.035),
      textAlign: TextAlign.center,
    );
  }