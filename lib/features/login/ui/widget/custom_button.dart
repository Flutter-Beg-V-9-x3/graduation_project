import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String text;
  final Future<bool> Function() onPressedAsync;
  final bool showDefaultMessages;

  const CustomButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.onPressedAsync,
    this.showDefaultMessages = true,
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

                bool success = await widget.onPressedAsync();

                setState(() => isLoading = false);

                if (widget.showDefaultMessages) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        success ? "Login Successful" : "Login Failed",
                      ),
                      backgroundColor: success ? Colors.green : Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
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