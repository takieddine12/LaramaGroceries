

import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {

  static List<String> titles = [
    "Shop Fresh, Anytime",
    "Save Time and Money",
    "Your Groceries, Your Way"
  ];

  static List<String> images = [
    "assets/images/supermarket.png",
    "assets/images/supermarket.png",
    "assets/images/supermarket.png"
  ];

  static List<String> descriptions = [
    "Explore a wide range of fresh fruits, vegetables, and daily essentials delivered straight to your doorstep. Convenience is just a tap away.",
    "Enjoy exclusive discounts and personalized offers while skipping the hassle of crowded stores. Shop smarter, live better.",
    "Create custom lists, set delivery schedules, and track your orders effortlessly. Grocery shopping tailored to your needs."
  ];

  static TextStyle getMediumFont(){
    return GoogleFonts.alata(fontWeight: FontWeight.w500);
  }

  static TextStyle getBoldFont(){
    return GoogleFonts.alata(fontWeight: FontWeight.bold);
  }

}