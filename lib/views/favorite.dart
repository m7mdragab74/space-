import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/space_helper.dart';
import 'package:flutter_application_1/models/space_model.dart';
import 'package:flutter_application_1/views/home.dart';
import 'package:flutter_application_1/views/search.dart';
import 'package:flutter_application_1/widget/custom_nav_bar.dart';
import 'package:flutter_application_1/widget/space_widget.dart';

class FavoriteChips extends StatefulWidget {
  const FavoriteChips({super.key});

  @override
  State<FavoriteChips> createState() => _FavoriteChipsState();
}

class _FavoriteChipsState extends State<FavoriteChips> {
  List<SpaceModel> _favorites = [];
  bool _isLoading = true;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    final db = DatabaseHelper();
    final favorites = await db.getFavorites();
    setState(() {
      _favorites = favorites;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Favorite',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              'Chips',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade700),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : ListView.builder(
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    return SpaceWidget(
                      spaceModel: _favorites[index],
                    );
                  },
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
