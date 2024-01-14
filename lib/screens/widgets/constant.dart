import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0xFF69B22A);
const kNeutralColor = Color(0xFF121F3E);
const kSubTitleColor = Color(0xFF4F5350);
const kLightNeutralColor = Color(0xFF8E8E8E);
const kDarkWhite = Color(0xFFF6F6F6);
const kWhite = Color(0xFFFFFFFF);
const kBorderColorTextField = Color(0xFFE3E3E3);
const ratingBarColor = Color(0xFFFFB33E);
const primaryColor = Color(0xFF69B22A);
const secondaryColor = Color(0xFF69B22A);
const thirdColor = Color.fromARGB(255, 27, 51, 6);
const bgColor = Color(0xFF212332);

const String emailIcon = 'assets/icons/email_icon.png';
const String lockIcon = 'assets/icons/lock_icon.png';
const String logoIcon = 'assets/icons/logo_icon.png';
const String menuIcon = 'assets/icons/menu_icon.png';
const String smallLogoIcon = 'assets/icons/small_logo_icon.png';
const String profileIcon = 'assets/icons/profile_icon.png';
const String userIcon = 'assets/icons/user_icon.jpg';
const String profitIcon = 'assets/icons/profit_icon.png';
const String requirementIcon = 'assets/icons/requirement_icon.png';
const String orderIcon = 'assets/icons/order_icon.png';
const String searchIcon = 'assets/icons/search_icon.png';
const String filterIcon = 'assets/icons/filter_icon.png';
const String dropdownIcon = 'assets/icons/dropdown_icon.png';
const String emptyImage = 'https://firebasestorage.googleapis.com/v0/b/drawing-on-demand.appspot.com/o/images%2Fempty_image.jpg?alt=media&token=746b3181-404b-4914-b9b1-c0820ef190fb';
const String calendarIcon = 'assets/icons/calendar_icon.png';

TextStyle ralewayStyle = GoogleFonts.raleway();

final kTextStyle = GoogleFonts.inter(
  color: kNeutralColor,
);

const kButtonDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

InputDecoration kInputDecoration = const InputDecoration(
  hintStyle: TextStyle(color: kSubTitleColor),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
    borderSide: BorderSide(color: kNeutralColor, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: kBorderColorTextField,
    ),
  );
}
