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
          Container(
            height: 80,
            width: double.infinity,
            child: Image.network(
              spaceModel.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            spaceModel.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
