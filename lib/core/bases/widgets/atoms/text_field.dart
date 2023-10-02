import 'package:flutter/material.dart';

import '../../../theme/_themes.dart';
import '../../enum/input_field_type.dart';
import '../../enum/text_field_type.dart';

class CTextField extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final CTextFieldType inputType;
  final InputFieldState inputState;
  final void Function(String)? onChanged;
  final void Function()? onComplete;
  final bool infiniteLines;

  const CTextField({
    required this.title,
    required this.hint,
    required this.controller,
    this.onChanged,
    this.infiniteLines = false,
    this.inputType = CTextFieldType.regular,
    this.inputState = InputFieldState.enabled,
    this.onComplete,
    super.key
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  bool _isSelected = false;
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    Color fieldColor;

    final currentState = (_isSelected && widget.inputState != InputFieldState.disabled ? 
      InputFieldState.focused : 
      widget.inputState);
    
    switch (currentState) {
      case InputFieldState.focused:
        fieldColor = CapstoneColors.purple;
        break;
      case InputFieldState.enabled:
        fieldColor = CapstoneColors.greySecondary;
        break;
      case InputFieldState.disabled:
        fieldColor = CapstoneColors.grey;
        break;
      case InputFieldState.error:
        fieldColor = CapstoneColors.red;
        break;
    }

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: fieldColor,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: FocusScope(
                    onFocusChange: (isFocused) {
                      setState(() {
                        _isSelected = isFocused;
                      });
                    },
                    child: TextField(
                      cursorColor: CapstoneColors.white,
                      controller: widget.controller,
                      onChanged: widget.onChanged,
                      style: const TextStyle(
                        color: CapstoneColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: _inputDecoration.copyWith(
                        filled: true,
                        fillColor: Colors.transparent,
                        // hintStyle: FontTheme.greyTextMedium(),
                      ),
                      maxLines: widget.infiniteLines ? null : 1,
                      onEditingComplete: widget.onComplete,
                      obscureText:
                          widget.inputType == CTextFieldType.password && _isHidden,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration get _inputDecoration {
    switch (widget.inputType) {
      case CTextFieldType.regular:
        return InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(
            color: CapstoneColors.white
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        );
      case CTextFieldType.password:
        return InputDecoration(
          hintStyle: const TextStyle(
            color: CapstoneColors.white
          ),
          hintText: widget.hint,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isHidden = !_isHidden;
              });
            },
            color: Colors.white,
            icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
          ),
        );
    }
  }
}