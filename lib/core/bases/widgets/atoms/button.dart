import 'package:capstone_project/core/extensions/text_style_extensions.dart';
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

    switch (buttonType) {
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

abstract class CapstoneTextButton extends StatelessWidget {
  const CapstoneTextButton({
    super.key,
    required this.onTap,
    required this.buttonColor,
    required this.textStyle,
    required this.text,
    this.isLoading,
    this.icon,
  });

  final Function() onTap;
  final Color buttonColor;
  final TextStyle textStyle;
  final String text;
  final bool? isLoading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: buttonColor,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 56,
            width: double.infinity,
            child: Center(
              child: isLoading != null && isLoading!
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 6,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(CapstoneColors.white),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: icon!,
                          ),
                        Text(
                          text,
                          style: textStyle.button,
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CapstonPurpleButtonPrimary extends CapstoneTextButton {
  const CapstonPurpleButtonPrimary({
    super.key,
    required Function() onTap,
    required String text,
    bool? isLoading,
    bool? isDisabled,
  }) : super(
          onTap: onTap,
          buttonColor: isDisabled != null && isDisabled
              ? CapstoneColors.purple50
              : CapstoneColors.purple,
          textStyle: CapstoneFontTheme.white,
          text: text,
          isLoading: isLoading,
        );
}

class CapstonRedButtonPrimary extends CapstoneTextButton {
  const CapstonRedButtonPrimary({
    super.key,
    required Function() onTap,
    required String text,
    bool? isLoading,
    bool? isDisabled,
  }) : super(
          onTap: onTap,
          buttonColor: isDisabled != null && isDisabled
              ? CapstoneColors.purple50
              : CapstoneColors.purple,
          textStyle: CapstoneFontTheme.white,
          text: text,
          isLoading: isLoading,
        );
}

class CapstoneRedButtonPrimary extends CapstoneTextButton {
  const CapstoneRedButtonPrimary({
    super.key,
    required Function() onTap,
    required String text,
  }) : super(
          onTap: onTap,
          buttonColor: CapstoneColors.red,
          textStyle: CapstoneFontTheme.white,
          text: text,
        );
}