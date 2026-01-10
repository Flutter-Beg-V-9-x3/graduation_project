import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final Future<void> Function() onPressedAsync;

  const CustomButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.onPressedAsync,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () async {
              if (widget.formKey.currentState!.validate()) {
                setState(() => isLoading = true);

                await widget.onPressedAsync();

                setState(() => isLoading = false);
              }
            },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? const SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
          : Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
    );
  }
}