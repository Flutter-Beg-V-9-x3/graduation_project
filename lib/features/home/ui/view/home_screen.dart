import 'package:flutter/material.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/Discover_section.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/category_chips_widget.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/for_you_section.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/search_bar_widget.dart';
import 'package:flutter_graduation_project/features/home/ui/widgets/trending_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscoverWidget(),

              SizedBox(height: 10),
              HomeSearchBar(),
              SizedBox(height: 20),
              CategoryChips(),
              SizedBox(height: 24),
              TrendingSection(),
              SizedBox(height: 24),
              ForYouSection(),
            ],
          ),
        ),
      ),
    );
  }
}
