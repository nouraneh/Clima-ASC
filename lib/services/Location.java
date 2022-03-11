import 'package:geolocator/geolocator.dart';
class Location {
  double Longitude;
  double Latitude;

  Future <void> getCurrentLocation()async{
    try {
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Latitude=position.latitude;
      Longitude=position.longitude;
      print(position);
    }
    catch(e){
      print(e);
    }
  }
}