// // import 'dart:ui' as ui; // لاحظ إضافة 'as ui' هنا
// // import 'package:flutter/material.dart';

// // class TrendingSection extends StatelessWidget {
// //   const TrendingSection({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               const Text(
// //                 "Trending Now",
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.w800,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               TextButton(
// //                 onPressed: () {},
// //                 child: const Text(
// //                   "See all",
// //                   style: TextStyle(
// //                     color: Color(0xFF7F13EC),
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),

// //         SizedBox(
// //           height: 280,
// //           child: ListView.builder(
// //             scrollDirection: Axis.horizontal,
// //             padding: const EdgeInsets.only(left: 20),
// //             clipBehavior: Clip.none,
// //             itemCount: 4,
// //             itemBuilder: (context, index) => const _TrendingCard(),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // class _TrendingCard extends StatelessWidget {
// //   const _TrendingCard();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 144,
// //       margin: const EdgeInsets.only(right: 16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const _MoviePoster(rating: "8.8"),
// //           const SizedBox(height: 12),
// //           const Text(
// //             "Dune: Part Two",
// //             maxLines: 1,
// //             overflow: TextOverflow.ellipsis,
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontSize: 14,
// //               fontWeight: FontWeight.w700,
// //             ),
// //           ),
// //           const SizedBox(height: 2),
// //           Text(
// //             "Sci-Fi, Adventure",
// //             maxLines: 1,
// //             style: TextStyle(
// //               color: Colors.white.withOpacity(0.5),
// //               fontSize: 12,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _MoviePoster extends StatefulWidget {
// //   final String rating;
// //   const _MoviePoster({required this.rating});

// //   @override
// //   State<_MoviePoster> createState() => _MoviePosterState();
// // }

// // class _MoviePosterState extends State<_MoviePoster> {
// //   bool _isHovered = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     return MouseRegion(
// //       onEnter: (_) => setState(() => _isHovered = true),
// //       onExit: (_) => setState(() => _isHovered = false),
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 300),
// //         curve: Curves.easeOut,
// //         transform: _isHovered
// //             ? (Matrix4.identity()..translate(0, -8, 0))
// //             : Matrix4.identity(),
// //         child: AspectRatio(
// //           aspectRatio: 2 / 3,
// //           child: Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(12),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: _isHovered
// //                       ? const Color(0xFF7F13EC).withOpacity(0.3)
// //                       : Colors.black26,
// //                   blurRadius: _isHovered ? 20 : 10,
// //                   offset: const Offset(0, 8),
// //                 ),
// //               ],
// //             ),
// //             child: Stack(
// //               children: [
// //                 Positioned.fill(
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(12),
// //                     child: Image.network(
// //                       'https://picsum.photos/300/450',
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned(
// //                   top: 8,
// //                   right: 8,
// //                   child: _RatingBadge(rating: widget.rating),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _RatingBadge extends StatelessWidget {
// //   final String rating;
// //   const _RatingBadge({required this.rating});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ClipRRect(
// //       borderRadius: BorderRadius.circular(6),
// //       child: BackdropFilter(
// //         // تم تغييرها هنا لتصبح ui.ImageFilter
// //         filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
// //         child: Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
// //           color: Colors.black.withOpacity(0.4),
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               const Icon(Icons.star, color: Colors.amber, size: 10),
// //               const SizedBox(width: 4),
// //               Text(
// //                 rating,
// //                 style: const TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 10,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// class TrendingSection extends StatelessWidget {
//   const TrendingSection({super.key});

//   // مصفوفة البيانات مطابقة للصورة المرفقة تماماً
//   final List<Map<String, String>> movieData = const [
//     {
//       "title": "Dune: Part Two",
//       "genre": "Sci-Fi, Adventure",
//       "rating": "8.8",
//       "image": "https://picsum.photos/id/101/400/600",
//     },
//     {
//       "title": "Oppenheimer",
//       "genre": "Drama, History",
//       "rating": "9.1",
//       "image": "https://picsum.photos/id/102/400/600",
//     },
//     {
//       "title": "Barbie",
//       "genre": "Comedy, Fantasy",
//       "rating": "7.9",
//       "image": "https://picsum.photos/id/103/400/600",
//     },
//     {
//       "title": "The Batman",
//       "genre": "Action, Crime",
//       "rating": "8.3",
//       "image": "https://picsum.photos/id/104/400/600",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Trending Now",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w800,
//                   color: Colors.white,
//                   letterSpacing: -0.5,
//                 ),
//               ),
//               _CustomSeeAllButton(onTap: () {}),
//             ],
//           ),
//         ),

//         SizedBox(
//           height: 320,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.only(left: 20),
//             clipBehavior: Clip.none,
//             physics: const BouncingScrollPhysics(),
//             itemCount: movieData.length,
//             itemBuilder: (context, index) => _TrendingCard(
//               title: movieData[index]["title"]!,
//               genre: movieData[index]["genre"]!,
//               rating: movieData[index]["rating"]!,
//               imageUrl: movieData[index]["image"]!,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _TrendingCard extends StatelessWidget {
//   final String title;
//   final String genre;
//   final String rating;
//   final String imageUrl;

//   const _TrendingCard({
//     required this.title,
//     required this.genre,
//     required this.rating,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 154,
//       margin: const EdgeInsets.only(right: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _MoviePoster(rating: rating, imageUrl: imageUrl),
//           const SizedBox(height: 12),

//           // اسم الفيلم المتغير
//           Text(
//             title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//               letterSpacing: -0.3,
//             ),
//           ),

//           const SizedBox(height: 4),

//           // التصنيف المتغير
//           Text(
//             genre,
//             maxLines: 1,
//             style: TextStyle(
//               color: Colors.white.withOpacity(0.5),
//               fontSize: 13,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MoviePoster extends StatefulWidget {
//   final String rating;
//   final String imageUrl;
//   const _MoviePoster({required this.rating, required this.imageUrl});

//   @override
//   State<_MoviePoster> createState() => _MoviePosterState();
// }

// class _MoviePosterState extends State<_MoviePoster> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       cursor: SystemMouseCursors.click,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 350),
//         curve: Curves.easeOutCubic,
//         transform: _isHovered
//             ? (Matrix4.identity()..translate(0, -10, 0))
//             : Matrix4.identity(),
//         child: AspectRatio(
//           aspectRatio: 2 / 3,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: _isHovered
//                       ? const Color(0xFF7F13EC).withOpacity(0.4)
//                       : Colors.black.withOpacity(0.3),
//                   blurRadius: _isHovered ? 25 : 12,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(widget.imageUrl, fit: BoxFit.cover),
//                   ),
//                 ),
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: _RatingBadge(rating: widget.rating),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _RatingBadge extends StatelessWidget {
//   final String rating;
//   const _RatingBadge({required this.rating});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: BackdropFilter(
//         filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           color: Colors.black.withOpacity(0.5),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
//               const SizedBox(width: 4),
//               Text(
//                 rating,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 11,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CustomSeeAllButton extends StatefulWidget {
//   final VoidCallback onTap;
//   const _CustomSeeAllButton({required this.onTap});

//   @override
//   State<_CustomSeeAllButton> createState() => _CustomSeeAllButtonState();
// }

// class _CustomSeeAllButtonState extends State<_CustomSeeAllButton> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: widget.onTap,
//         child: AnimatedDefaultTextStyle(
//           duration: const Duration(milliseconds: 200),
//           style: TextStyle(
//             color: const Color(0xFF7F13EC).withOpacity(_isHovered ? 0.6 : 1.0),
//             fontSize: 14,
//             fontWeight: FontWeight.w700,
//           ),
//           child: const Text("See all"),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  final List<Map<String, String>> movieData = const [
    {
      "title": "Dune: Part Two",
      "genre": "Sci-Fi, Adventure",
      "rating": "8.8",
      "image": "assets/images/DuneTwo.jpg",
    },
    {
      "title": "Oppenheimer",
      "genre": "Drama, History",
      "rating": "9.1",
      "image": "assets/images/oppenheimer.jpg",
    },
    {
      "title": "Barbie",
      "genre": "Comedy, Fantasy",
      "rating": "7.9",
      "image": "assets/images/Barbie.jpg",
    },
    {
      "title": "The Batman",
      "genre": "Action, Crime",
      "rating": "8.3",
      "image": "assets/images/the batman.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              _CustomSeeAllButton(onTap: () {}), // استدعاء الزر المخصص
            ],
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: movieData.length,
            itemBuilder: (context, index) => _TrendingCard(
              title: movieData[index]["title"]!,
              genre: movieData[index]["genre"]!,
              rating: movieData[index]["rating"]!,
              imagePath: movieData[index]["image"]!,
            ),
          ),
        ),
      ],
    );
  }
}

class _TrendingCard extends StatelessWidget {
  final String title;
  final String genre;
  final String rating;
  final String imagePath;

  const _TrendingCard({
    required this.title,
    required this.genre,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviePoster(rating: rating, imagePath: imagePath),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            genre,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatefulWidget {
  final String rating;
  final String imagePath;
  const _MoviePoster({required this.rating, required this.imagePath});

  @override
  State<_MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<_MoviePoster> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -10, 0))
            : Matrix4.identity(),
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? const Color(0xFF7F13EC).withOpacity(0.4)
                      : Colors.black26,
                  blurRadius: 12,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: _RatingBadge(
                    rating: widget.rating,
                  ), // تأكدي من وجود هذا الكلاس في الأسفل
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- الأجزاء التي قد تكون ناقصة عندك ---

class _RatingBadge extends StatelessWidget {
  final String rating;
  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          color: Colors.black.withOpacity(0.5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomSeeAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CustomSeeAllButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: const Text(
        "See all",
        style: TextStyle(color: Color(0xFF7F13EC), fontWeight: FontWeight.bold),
      ),
    );
  }
}
