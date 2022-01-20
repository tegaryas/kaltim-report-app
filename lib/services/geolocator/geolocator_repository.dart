import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/services/geolocator/geolocator_repository_interface.dart';

@Injectable(as: GeolocatorRepositoryInterface)
class GeolocatorRepository implements GeolocatorRepositoryInterface {
  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
