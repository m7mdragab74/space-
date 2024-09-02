import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/space_model.dart';
import 'package:flutter_application_1/services/space_services.dart';
import 'package:flutter_application_1/widget/space_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<SpaceModel>> spaceFuture;

  @override
  void initState() {
    super.initState();
    SpaceService spaceService = SpaceService(Dio());
    spaceFuture = spaceService.getSpaceDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<SpaceModel>>(
        future: spaceFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return SizedBox(
              height: 900,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SpaceWidget(spaceModel: snapshot.data![index]);
                  }),
            );
          } else {
            return Center(
              child: Text('No Data Available'),
            );
          }
        },
      ),
    );
  }
}
