import 'package:flutter/material.dart';

class SynopsisPage extends StatelessWidget {
  const SynopsisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF120B1E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Synopsis',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Description
            const Text(
              "Earth's future has been riddled by disasters, famines, and droughts. "
              "There is only one way to ensure mankind's survival:\n\n"
              "Interstellar travel. A newly discovered wormhole in the far reaches "
              "of our solar system allows a team of astronauts to go where no man "
              "has gone before, a planet that may have the right environment to "
              "sustain human life.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            // Read more
            GestureDetector(
              onTap: () {
                // TODO: Read more action
              },
              child: const Text(
                'Read more',
                style: TextStyle(
                  color: Color(0xFF9B5CFF),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
