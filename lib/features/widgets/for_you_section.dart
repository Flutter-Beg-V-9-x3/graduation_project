// import 'package:flutter/material.dart';

// class ForYouSection extends StatelessWidget {
//   const ForYouSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Text(
//             "For You",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         const SizedBox(height: 14),
//         GridView.count(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           crossAxisCount: 2,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 20,
//           childAspectRatio: 0.68,
//           children: const [
//             _PosterCard(
//               title: "Dune: Part Two",
//               rating: "8.8",
//               year: "2024",
//               badge: "98% Match",
//               image: "https://picsum.photos/400/600?1",
//             ),
//             _PosterCard(
//               title: "Civil War",
//               rating: "7.6",
//               year: "2024",
//               image: "https://picsum.photos/400/600?2",
//             ),
//             _PosterCard(
//               title: "Poor Things",
//               rating: "8.4",
//               year: "2023",
//               image: "https://picsum.photos/400/600?3",
//             ),
//             _PosterCard(
//               title: "The Creator",
//               rating: "6.9",
//               year: "2023",
//               badge: "New",
//               image: "https://picsum.photos/400/600?4",
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class _PosterCard extends StatefulWidget {
//   final String title;
//   final String rating;
//   final String year;
//   final String image;
//   final String? badge;

//   const _PosterCard({
//     required this.title,
//     required this.rating,
//     required this.year,
//     required this.image,
//     this.badge,
//   });

//   @override
//   State<_PosterCard> createState() => _PosterCardState();
// }

// class _PosterCardState extends State<_PosterCard> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: MouseRegion(
//             onEnter: (_) => setState(() => _isHovered = true),
//             onExit: (_) => setState(() => _isHovered = false),
//             cursor: SystemMouseCursors.click,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16),
//               child: Stack(
//                 children: [
//                   // 1. الصورة مع التكبير
//                   AnimatedScale(
//                     scale: _isHovered ? 1.1 : 1.0,
//                     duration: const Duration(milliseconds: 300),
//                     child: Image.network(
//                       widget.image,
//                       width: double.infinity,
//                       height: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   // 2. طبقة "العتمة" (تختفي عند الـ Hover)
//                   // هذه الطبقة تجعل الصورة داكنة جداً في الحالة العادية
//                   AnimatedOpacity(
//                     opacity: _isHovered ? 0.0 : 0.6, // عتمة بنسبة 60%
//                     duration: const Duration(milliseconds: 300),
//                     child: Container(color: Colors.black),
//                   ),

//                   // 3. طبقة "الضوء" (تظهر فقط عند الـ Hover)
//                   AnimatedOpacity(
//                     opacity: _isHovered ? 1.0 : 0.0,
//                     duration: const Duration(milliseconds: 300),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: RadialGradient(
//                           colors: [
//                             Colors.white.withOpacity(0.3), // ضوء أبيض مركز وقوي
//                             Colors.transparent,
//                           ],
//                           radius: 0.7,
//                         ),
//                       ),
//                     ),
//                   ),

//                   // 4. الشارة (Badge)
//                   if (widget.badge != null)
//                     Positioned(
//                       top: 10,
//                       left: 10,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF7F13EC),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           widget.badge!,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         // نصوص ثابتة
//         Text(
//           widget.title,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 4),
//         Row(
//           children: [
//             const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
//             const SizedBox(width: 4),
//             Text(
//               widget.rating,
//               style: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(width: 6),
//             Text("•", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//             const SizedBox(width: 6),
//             Text(
//               widget.year,
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "For You",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 14),
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 0.68,
          children: const [
            _PosterCard(
              title: "Dune: Part Two",
              rating: "8.8",
              year: "2024",
              badge: "98% Match",
              imagePath: "assets/images/Dune Part Two .jpg", // مسار محلي
            ),
            _PosterCard(
              title: "Civil War",
              rating: "7.6",
              year: "2024",
              imagePath: "assets/images/Civil War.jpg", // مسار محلي
            ),
            _PosterCard(
              title: "Poor Things",
              rating: "8.4",
              year: "2023",
              imagePath: "assets/images/Poor Things.jpg", // مسار محلي
            ),
            _PosterCard(
              title: "The Creator",
              rating: "6.9",
              year: "2023",
              badge: "New",
              imagePath: "assets/images/The Creator.jpg", // مسار محلي
            ),
          ],
        ),
      ],
    );
  }
}

class _PosterCard extends StatefulWidget {
  final String title;
  final String rating;
  final String year;
  final String imagePath; // تغيير الاسم ليكون أوضح
  final String? badge;

  const _PosterCard({
    required this.title,
    required this.rating,
    required this.year,
    required this.imagePath,
    this.badge,
  });

  @override
  State<_PosterCard> createState() => _PosterCardState();
}

class _PosterCardState extends State<_PosterCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            cursor: SystemMouseCursors.click,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // 1. استخدام Image.asset بدلاً من Image.network
                  AnimatedScale(
                    scale: _isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(
                      widget.imagePath, // استخدام المسار المحلي
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // طبقة العتمة
                  AnimatedOpacity(
                    opacity: _isHovered ? 0.0 : 0.6,
                    duration: const Duration(milliseconds: 300),
                    child: Container(color: Colors.black),
                  ),

                  // طبقة الضوء عند الـ Hover
                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withOpacity(0.3),
                            Colors.transparent,
                          ],
                          radius: 0.7,
                        ),
                      ),
                    ),
                  ),

                  // الشارة (Badge)
                  if (widget.badge != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF7F13EC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.badge!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
            const SizedBox(width: 4),
            Text(
              widget.rating,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            Text("•", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(width: 6),
            Text(
              widget.year,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
