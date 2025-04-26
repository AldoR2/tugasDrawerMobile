import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onChangedCallback;
  final String? Function()? errorTextProvider;

  const ReusableTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.obscureText,
    required this.onChangedCallback,
    required this.errorTextProvider,
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
        controller: widget.controller,
        onChanged: (text) => widget.onChangedCallback(),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          errorText: widget.errorTextProvider!(),
          prefixIcon: Icon(widget.icon),
          filled: true,
          fillColor: Colors.amber[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37)), // Warna border saat aktif
          ),
          enabledBorder: OutlineInputBorder( // Tambahkan properti ini
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 223, 96, 37)), // Warna border saat tidak aktif
          ),
          labelStyle: TextStyle(color: Colors.grey),
          floatingLabelStyle: TextStyle(color: Color.fromARGB(255, 223, 96, 37)),
        ),
      ),
    );
  }
}