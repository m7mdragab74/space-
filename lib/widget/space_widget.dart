import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/space_model.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({super.key, required this.spaceModel});
  final SpaceModel spaceModel;

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
                    spaceModel.image ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 80,
                        child: const Center(child: Text('Image not available')),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            spaceModel.name ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            spaceModel.homePorts ?? '',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
