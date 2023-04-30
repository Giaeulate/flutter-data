import 'package:flutter/material.dart';
import '../../theme/theme_app.dart';
import '../../utils/date_utils.dart';
import '../custom_text.dart';

class CustomDateInput extends StatefulWidget {
  final String? label;
  final String name;
  final Map<String, dynamic> formData;
  final bool isRequired;
  final String? textError;
  final bool isDouble;
  final bool isExternalLabel;
  final double? spaceExternalLabel;

  const CustomDateInput({
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
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.isExternalLabel
            ? CustomText(text: widget.label ?? "")
            : const SizedBox(),
        SizedBox(height: widget.spaceExternalLabel ?? 0.0),
        TextFormField(
          controller: TextEditingController(
            text: widget.formData[widget.name] != null
                ? dateToDateStringUtils(widget.formData[widget.name])
                : "",
          ),
          decoration: InputDecoration(
            label: !widget.isExternalLabel && widget.label != null
                ? CustomText(text: '${widget.label}')
                : null,
            focusedBorder: ApplicationTheme.focusBorder,
            border: ApplicationTheme.disableBorder,
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate;
            pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(DateTime.now().year - 20),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime.now(),
            );

            if (pickedDate == null) return;

            selectedDate = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
            );
            widget.formData[widget.name] = selectedDate;
            if (mounted) {
              setState(() {});
            }
          },
          onSaved: (value) => widget.formData[widget.name] = value,
          validator: widget.isRequired
              ? (value) {
                  if (value == null ||
                      value.isEmpty ||
                      widget.formData[widget.name] == null ||
                      widget.formData[widget.name].toString().isEmpty) {
                    return widget.textError ?? 'Este campo es obligatorio';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
