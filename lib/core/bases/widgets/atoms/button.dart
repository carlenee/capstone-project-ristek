import 'package:flutter/material.dart';

import '../../../theme/_themes.dart';
import '../../enum/button_type.dart';

class CButton extends StatelessWidget {
  final String text;
  final Function? onTap;
  final bool isLoading;
  final bool isDisabled;
  final CButtonType buttonType;
  final double innerHorizontalPadding;
  final double innerVerticalPadding;
  const CButton({
    required this.text,
    this.onTap,
    this.buttonType = CButtonType.primary,
    this.isLoading = false,
    this.isDisabled = false,
    this.innerHorizontalPadding = 20,
    this.innerVerticalPadding = 18,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    Color buttonColor;

    switch (this.buttonType) {
      case CButtonType.primary:
        textColor = CapstoneColors.white;
        buttonColor = CapstoneColors.purple;
        break;
      case CButtonType.secondary:
        textColor = CapstoneColors.purple;
        buttonColor = CapstoneColors.grey;
      case CButtonType.tertiary:
        textColor = CapstoneColors.white;
        buttonColor = Colors.transparent;
    }

    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isLoading & !isDisabled && onTap != null) {
            onTap!();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: innerVerticalPadding,
            horizontal: innerHorizontalPadding,
          ),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        )
      )
    );
  }
}