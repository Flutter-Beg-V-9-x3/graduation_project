import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

/// A widget that provides a text area for writing review comments.
/// It includes a character counter and supports pre-filling text for edit mode.
class ReviewCommentBox extends StatefulWidget {
  final int maxLength;
  final ValueChanged<String>? onChanged;

  // The initial text to display (used when editing an existing review)
  final String? initialText;

  const ReviewCommentBox({
    super.key,
    this.maxLength = 500,
    this.onChanged,
    this.initialText,
  });

  @override
  State<ReviewCommentBox> createState() => _ReviewCommentBoxState();
}

class _ReviewCommentBoxState extends State<ReviewCommentBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the old text if provided, otherwise empty.
    _controller = TextEditingController(text: widget.initialText ?? "");
  }

  @override
  void dispose() {
    // Always dispose the controller to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the height of the text box based on screen height.
    final double boxHeight = MediaQuery.of(context).size.height * 0.35;

    return SizedBox(
      height: boxHeight,
      child: Stack(
        children: [
          // --- Text Input Area ---
          Container(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: _controller,
              maxLength: widget.maxLength,
              maxLines: null, // Allows unlimited lines within the expanded area
              expands: true, // Fills the available parent height
              textAlignVertical: TextAlignVertical.top, // Start typing from top
              style: AppTextStyles.reviewContent.copyWith(fontSize: 18),
              
              decoration: const InputDecoration(
                hintText:
                    'Share your thoughts on the movie... What\n did you like? What did you dislike?',
                border: InputBorder.none,
                // Hide default counter to use the custom one below
                counterText: '',
              ),

              onChanged: (value) {
                // Notify parent widget of changes
                widget.onChanged?.call(value);
                // Trigger rebuild to update the local character counter
                setState(() {});
              },
            ),
          ),

          // --- Custom Character Counter (Bottom Right) ---
          Positioned(
            bottom: 24,
            right: 26,
            child: Text(
              '${_controller.text.length} / ${widget.maxLength}',
              style: AppTextStyles.ratingLabel,
            ),
          ),
        ],
      ),
    );
  }
}