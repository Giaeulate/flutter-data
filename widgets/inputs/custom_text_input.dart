import 'package:flutter/material.dart';

import '../../theme/theme_app.dart';
import '../custom_text.dart';

class CustomTextInput extends StatelessWidget {
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isExternalLabel;
  final double? spaceExternalLabel;
  
  const CustomTextInput({
    super.key,
    this.label,
    required this.name,
    required this.formData,
    this.isRequired = true,
    this.textError,
    this.isExternalLabel = false,
    this.spaceExternalLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        isExternalLabel ? CustomText(text: label ?? "") : const SizedBox(),
        SizedBox(height: spaceExternalLabel ?? 0.0),
        TextFormField(
          decoration: InputDecoration(
            label: !isExternalLabel && label != null
                ? CustomText(text: '$label')
                : null,
            focusedBorder: ApplicationTheme.focusBorder,
            border: ApplicationTheme.disableBorder,
          ),
          onSaved: (value) => formData[name] = value,
          validator: isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return textError ?? 'Este campo es obligatorio';
                  }
                  formData[name] = value;
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
