import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1B2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Average Rating
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'AVERAGE RATING',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    '8.6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xFF9B5CFF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          // Divider
          Container(
            height: 50,
            width: 1,
            color: Colors.white24,
          ),

          const Spacer(),

          // Rotten Tomatoes
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'ROTTEN TOMATOES',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '73%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
