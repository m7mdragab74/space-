import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/space_model.dart';

class SpaceService {
  final Dio dio;

  SpaceService(this.dio);

  Future<List<SpaceModel>> getSpaceDetail() async {
    try {
      Response response = await dio.get('https://api.spacexdata.com/v4/ships');
      List<dynamic> space = response.data;
      List<SpaceModel> spaceList = [];
      for (var spaces in space) {
        SpaceModel spaceModel = SpaceModel.fromJson(spaces);
        spaceList.add(spaceModel);
      }
      return spaceList;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
