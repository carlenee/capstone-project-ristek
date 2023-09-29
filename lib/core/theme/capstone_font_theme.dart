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

  static TextStyle whiteTitle() {
    return const TextStyle(
      color: CapstoneColors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle whiteSubtitle() {
    return const TextStyle(
      color: CapstoneColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle whiteCaption() {
    return const TextStyle(
      color: CapstoneColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle whiteCaptionBold() {
    return const TextStyle(
      color: CapstoneColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle whiteCaptionLink() {
    return const TextStyle(
      color: CapstoneColors.purple,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  // Red
  static TextStyle redSubtitle() {
    return const TextStyle(
      color: CapstoneColors.red,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle redCaptionBold() {
    return const TextStyle(
      color: CapstoneColors.red,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }
}
