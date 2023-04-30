import 'package:flutter/material.dart';
import 'package:la_cascada/src/widgets/custom_button.dart';

import 'custom_type_form.dart';

class CustomForm extends StatefulWidget {
  final List<Map<String, dynamic>> json;
  final String textButton;
  final Color? textColor;
  final double space;
  final double? spaceExternalLabel;
  final EdgeInsets? padding;
  final Function(dynamic value)? onPressed;
  const CustomForm({
    super.key,
    required this.json,
    this.textButton = 'Continuar',
    this.textColor,
    this.space = 0.0,
    this.spaceExternalLabel,
    this.padding,
    this.onPressed,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _formData = {};

  void canSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: widget.padding ?? const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...widget.json.map<Widget>(
                (field) {
                  var column = Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTypeForm(
                        spaceExternalLabel: widget.spaceExternalLabel,
                        field: field,
                        formData: _formData,
                        canSetState: canSetState,
                      ),
                    ],
                  );
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: widget.space,
                    ),
                    child: column,
                  );
                },
              ).toList(),
              CustomButton(
                label: "Registrar",
                onPressed: widget.onPressed != null
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          // _formKey.currentState!.save();
                          widget.onPressed!(_formData);
                        }
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
