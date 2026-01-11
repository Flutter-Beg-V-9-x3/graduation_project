import 'package:flutter/material.dart';

class MovieReviewSplash extends StatelessWidget {
  const MovieReviewSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
           static const Color background = Color(0xFF191022),
 
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         
      
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.movie_creation_rounded,
                    size: 40,
                    color: Color(0xFFB985FF),
                  ),
                ),

                /// STAR BADGE
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB985FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            @override
            Widget build(BuildContext){
              return Column(
              mainAxisAlignment : MainAxisAlignment.min,
              children:[const Text(
              'MovieReview',style:appTextStyles.bodybold),]
              )
            }
          
            ),

            const SizedBox(height: 8),

          @override
            Widget build(BuildContext){
              return Column(
              mainAxisAlignment : MainAxisAlignment.min,
              children:[const Text(
              'SHARE YOUR PERSPECTIVE',,style:appTextStyles.bodyMedium ,color: Colors.white.withOpacity(0.6),),]
              )
            }
          

            const SizedBox(height: 120),
  @override
            Widget build(BuildContext){
              return Column(
              mainAxisAlignment : MainAxisAlignment.min,
              children:[const Text(
            'Powered by Mohamad Al-Zoubi | Flutter Beg V.9',style:appTextStyles.bodyMedium ,color: Colors.white.withOpacity(0.4),),]
              )
            }
          
           
           
  },
},
  