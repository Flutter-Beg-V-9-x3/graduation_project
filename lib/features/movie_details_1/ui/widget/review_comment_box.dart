import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/core/theme/app_text_styles.dart';

class ReviewCommentBox extends StatefulWidget {
  final int maxLength;
  final ValueChanged<String>? onChanged;

  const ReviewCommentBox({super.key, this.maxLength = 500, this.onChanged});

  @override
  State<ReviewCommentBox> createState() => _ReviewCommentBoxState();
}

class _ReviewCommentBoxState extends State<ReviewCommentBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double boxHeight = MediaQuery.of(context).size.height * 0.35;

    return SizedBox(
      height: boxHeight,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(14.0),
            child: TextField(
              controller: _controller,
              maxLength: widget.maxLength,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              style: AppTextStyles.reviewDate,
              decoration: const InputDecoration(
                hintText:
                    'Share your thoughts on the movie... What\n did you like? What did you dislike?',
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (value) {
                setState(() {});
                widget.onChanged?.call(value);
              },
            ),
          ),

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