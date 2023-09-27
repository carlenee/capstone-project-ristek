part of '_themes.dart';

class CapstoneFontTheme {
  static final fontFamily = GoogleFonts.inter().fontFamily;

  static const black = TextStyle(color: CapstoneColors.blackPrimary);

  static const greySecondary = TextStyle(color: CapstoneColors.greySecondary);

  static final greySecondaryHeader = TextStyle(
      color: CapstoneColors.greySecondary,
      fontSize: 26,
      fontWeight: FontWeight.bold,
      fontFamily: fontFamily);

  static final greySecondaryMedium = TextStyle(
      color: CapstoneColors.greySecondary,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily);

  static const white = TextStyle(color: CapstoneColors.white);

  static const whiteLarge =
      TextStyle(color: CapstoneColors.white, fontSize: 26);

  static const purple = TextStyle(color: CapstoneColors.purple);

  static const purpleheader = TextStyle(
      color: CapstoneColors.purple, fontWeight: FontWeight.bold, fontSize: 26);
}
