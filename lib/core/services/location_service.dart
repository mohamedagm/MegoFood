import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mego_food/features/auth/data/models/address_model.dart';

class LocationService {
  Future<AddressModel> getCurrentAddress() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();

    final placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    final place = placemarks.first;

    return AddressModel(
      street: place.street ?? '',
      city: place.locality ?? '',
      state: place.administrativeArea ?? '',
      postalCode: place.postalCode ?? '',
      country: place.country ?? '',
    );
  }
}
