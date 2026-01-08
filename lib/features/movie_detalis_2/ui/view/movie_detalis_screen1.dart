import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widgets/movie_details_header.dart';
import 'package:flutter_graduation_project/features/movie_details_1/ui/widgets/movie_info_card.dart';

class MovieDetailsScreen1 extends StatefulWidget {
  const MovieDetailsScreen1({super.key});

  @override
  State<MovieDetailsScreen1> createState() => _MovieDetailsScreen1State();
}

class _MovieDetailsScreen1State extends State<MovieDetailsScreen1> {
  void _onBackOrCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              MovieDetailsHeader(
                onBackPressed: _onBackOrCancel,
                onCancelPressed: _onBackOrCancel,
              ),
              const MovieInfoCard(),
            ],
          ),
        ],
      ),
    );
  }
}
