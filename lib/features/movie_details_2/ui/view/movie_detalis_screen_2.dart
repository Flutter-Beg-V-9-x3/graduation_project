import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/movie_details_2/ui/widget/movie_details_header.dart';
import 'package:flutter_graduation_project/features/movie_details_2/ui/widget/movie_info_card.dart';

class MovieDetailsScreen2 extends StatefulWidget {
  const MovieDetailsScreen2({super.key});

  @override
  State<MovieDetailsScreen2> createState() => _MovieDetailsScreen2State();
}

class _MovieDetailsScreen2State extends State<MovieDetailsScreen2> {
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
