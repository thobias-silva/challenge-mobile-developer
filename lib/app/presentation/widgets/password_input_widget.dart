import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final void Function(String) onChanged;
  final String? errorText;

  const PasswordInput({
    super.key,
    required this.onChanged,
    this.errorText,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void toggleObscureText() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: 'Senha',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          onPressed: toggleObscureText,
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
      ),
    );
  }
}
