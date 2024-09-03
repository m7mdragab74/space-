import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/space_helper.dart';
import 'package:flutter_application_1/models/space_model.dart';

class SpaceWidget extends StatefulWidget {
  const SpaceWidget({super.key, required this.spaceModel});
  final SpaceModel spaceModel;

  @override
  State<SpaceWidget> createState() => _SpaceWidgetState();
}

class _SpaceWidgetState extends State<SpaceWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final db = DatabaseHelper();
      final favorites = await db.getFavorites();
      setState(() {
        isFavorite =
            favorites.any((spaces) => spaces.id == widget.spaceModel.id);
      });
    } catch (e) {
      print("Error checking if favorite: $e");
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final db = DatabaseHelper();
      if (isFavorite) {
        await db.deleteFavorite(widget.spaceModel.id);
      } else {
        await db.insertFavorite(widget.spaceModel);
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      print("Error toggling favorite: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.network(
                    widget.spaceModel.image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 80,
                        child: Center(child: Text('Image not available')),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            widget.spaceModel.name ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            widget.spaceModel.homePorts ?? '',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
