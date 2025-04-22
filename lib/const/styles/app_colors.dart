import 'package:flutter/material.dart';

abstract class AppColors {
  static const kPrimaryColor = Color(0xFFFA003F); // New primary color
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const Color kSecondaryBlackColor = Color(0xFF0D0E0F);

  static const kSecondaryColor = Color(0xFFFF6B8A); // Adjusted to complement primary

  // Red variants replacing blue variants
  static const kRed100 = Color(0xFFFFDAE2);
  static const kRed200 = Color(0xFFFFB5C5);
  static const kRed300 = Color(0xFFFF8CA9);
  static const kRed400 = Color(0xFFFF618D);
  static const kRed500 = Color(0xFFFF3871);
  static const kRed600 = Color(0xFFFA003F); // Same as primary
  static const kRed700 = Color(0xFFD60035);
  static const kRed800 = Color(0xFFB2002C);
  static const kRed900 = Color(0xFF8F0023);

  static const fontColor = Color(0XFF49476B);

  // Gradient colors adjusted for red theme
  static const gradientRed = Color(0xFFFA003F); // Primary color
  static const gradientRed2 = Color(0xCEFF2D54); // Lighter variant
  static const gradientRedDark = Color(0xFF4A0012); // Darker complementary
  static const gradientRedDark2 = Color(0xFF330011); // Even darker complementary

  // Grey colors remain unchanged
  static const Color kGrey = Color(0xFF91919F);
  static const Color kGrey100 = Color(0xFFf8f8f8);
  static const Color kGrey200 = Color(0xFFf0f0f0);
  static const Color kGrey300 = Color(0xFFE0E0E0);
  static const Color kGrey400 = Color(0xFFBBBBBB);
  static const Color kGrey500 = Color(0xFF909090);
  static const Color kGrey600 = Color(0xFF666666);
  static const Color kGrey700 = Color(0xFF464646);
  static const Color kGrey800 = Color(0xFF3c3c3c);
  static const Color kGrey900 = Color(0xFF2d2d2d);

  static const Color kErrorColor = Colors.red;
  static const Color kSuccessColor = Colors.green;

  // Wallet mesh gradient colors adjusted to complement the new red theme
  static Color walletMeshGradient01 = const Color.fromARGB(255, 62, 14, 35); // Dark red
  static Color walletMeshGradient02 = const Color.fromARGB(255, 223, 12, 83); // Bright red
  static Color walletMeshGradient03 = const Color.fromARGB(255, 149, 13, 64); // Medium red
  static Color walletMeshGradient04 = const Color.fromARGB(255, 254, 33, 96); // Light bright red

  static Color kDeepGreen = Color(0xFF28998B);
  static Color kLightGreen = Color(0x0ff2e0de);
  static Color kRed = Color(0x0ff4001b);
}
