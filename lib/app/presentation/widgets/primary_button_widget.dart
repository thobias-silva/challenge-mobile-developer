import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final bool isLoading;
  final bool enabled;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled
          ? isLoading
              ? () {}
              : onPressed
          : null,
      child: isLoading
          ? const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Text(title),
    );
  }
}
