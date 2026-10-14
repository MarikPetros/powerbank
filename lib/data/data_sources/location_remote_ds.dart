import 'dart:convert';
import '../../core/api/api_client.dart';
import '../models/location_model.dart';

class LocationRemoteDataSource {
  final ApiClient client;

  LocationRemoteDataSource(this.client);

  Future<List<LocationModel>> fetchAll() async {
    final res = await client.get('/api/v1/manager/locations/cards');
    if (res.statusCode != 200) {
      throw Exception('Locations load error');
    }
    final list = json.decode(res.body) as List;
    return list.map((e) => LocationModel.fromJson(e)).toList();
  }
}
