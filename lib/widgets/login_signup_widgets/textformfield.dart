import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  const TextForm(
      {super.key,
      required this.isPassword,
      this.controller,
      this.fieldKey,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      required this.labelText});

  final bool isPassword;
  final TextEditingController? controller;
  final Key? fieldKey;
  final String? labelText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText: widget.isPassword?isObscure:false,
      controller: widget.controller,
      key: widget.fieldKey,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: InputBorder.none,
          labelText: widget.labelText,
        suffixIcon: widget.isPassword?
        GestureDetector(
          onTap: (){
            setState(() {
              isObscure = !isObscure;
            });
          },
            child: isObscure?const Icon(Icons.visibility):const Icon(Icons.visibility_off)
        )
        :const Text("")
      ),
    );
  }
}
