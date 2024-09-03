import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/favorite.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/widget/custom_nav_bar.dart';

class SearchChips extends StatefulWidget {
  const SearchChips({super.key});

  @override
  State<SearchChips> createState() => _SearchChipsState();
}

class _SearchChipsState extends State<SearchChips> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'No search available now check it later...',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        pages: const [
          HomePage(),
          SearchChips(),
          FavoriteChips(),
        ],
        color: HomePage.primaryColor,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
