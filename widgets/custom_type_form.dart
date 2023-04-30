import 'package:flutter/material.dart';
import 'inputs/custom_date_input.dart';
import 'inputs/custom_dropdown_input.dart';

class CustomTypeForm extends StatelessWidget {
  final Map<String, dynamic> field;
  final Map<String, dynamic> formData;
  final VoidCallback canSetState;
  final double? spaceExternalLabel;

  const CustomTypeForm({
    super.key,
    required this.field,
    required this.formData,
    required this.canSetState,
    this.spaceExternalLabel,
  });

  @override
  Widget build(BuildContext context) {
    final String name = field['name'];
    final String? label = field['label'];
    final String type = field['type'];

    switch (type) {
      case 'text':
        return CustomTextInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          label: label,
          isExternalLabel: field['is_external_label'] ?? false,
          name: name,
          textError: field['text_error'],
          isRequired: field['is_required'] ?? true,
        );
      case 'number':
        return CustomNumberInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          isExternalLabel: field['is_external_label'] ?? false,
          label: label,
          name: name,
          textError: field['text_error'],
        );
      case 'date':
        return CustomDateInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          isExternalLabel: field['is_external_label'] ?? false,
          label: label,
          name: name,
          textError: field['text_error'],
        );
      case 'dropdown':
        return CustomDropdownInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          label: label,
          isExternalLabel: field['is_external_label'] ?? false,
          name: name,
          textError: field['text_error'],
          data: field,
        );
      case 'checkbox':
        return CustomCheckboxInput(
          spaceExternalLabel: spaceExternalLabel,
          formData: formData,
          label: label,
          isExternalLabel: field['is_external_label'] ?? false,
          name: name,
          textError: field['text_error'],
          data: field,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
