import 'package:geolocator/geolocator.dart';

abstract class GeolocatorRepositoryInterface {
  Future<Position?> getCurrentLocation();
}
