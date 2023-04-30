import 'package:flutter/material.dart';

import '../../theme/theme_app.dart';
import '../custom_text.dart';

class CustomDropdownInput extends StatelessWidget {
  final Map<String, dynamic> data;
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isExternalLabel;
  final double? spaceExternalLabel;

  const CustomDropdownInput({
    super.key,
    required this.data,
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
    final List<dynamic>? options = data['options'];
    final List<DropdownMenuItem<String>> dropdownOptions = options
            ?.map((option) => DropdownMenuItem<String>(
                  value: option['value'],
                  child: CustomText(text: option['label']),
                ))
            .toList() ??
        [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        isExternalLabel ? CustomText(text: label ?? "") : const SizedBox(),
        SizedBox(height: spaceExternalLabel ?? 0.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            label: !isExternalLabel && label != null
                ? CustomText(text: '$label')
                : null,
            focusedBorder: ApplicationTheme.focusBorder,
            border: ApplicationTheme.disableBorder,
          ),
          items: dropdownOptions,
          onChanged: (value) => formData[name] = value,
          onSaved: (value) => formData[name] = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return textError ?? 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ],
    );
  }
}
