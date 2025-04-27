import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onChangedCallback;
  final String? Function()? errorTextProvider;
  final TextInputType inputType;

  const ReusableTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.obscureText,
    required this.onChangedCallback,
    required this.errorTextProvider,
    required this.inputType,
  });

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: (text) => widget.onChangedCallback(),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.errorTextProvider!(),
          prefixIcon: Icon(widget.icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
