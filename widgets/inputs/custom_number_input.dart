import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme_app.dart';
import '../custom_text.dart';

class CustomNumberInput extends StatelessWidget {
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isDouble;
  final bool isExternalLabel;
  final double? spaceExternalLabel;

  const CustomNumberInput({
    super.key,
    this.label,
    required this.name,
    required this.formData,
    this.isRequired = true,
    this.textError,
    this.isDouble = false,
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
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onSaved: (value) => formData[name] = value,
          validator: isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return textError ?? 'Este campo es obligatorio';
                  }
                  if (isDouble && double.tryParse(value) == null) {
                    return 'Este campo debe ser numérico';
                  }
                  if (!isDouble && int.tryParse(value) == null) {
                    return 'Este campo debe ser numérico';
                  }

                  formData[name] =
                      isDouble ? double.parse(value) : int.parse(value);
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
