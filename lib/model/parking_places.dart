import 'package:json_annotation/json_annotation.dart';
import 'package:scooty/model/transport.dart';

part 'parking_places.g.dart';

@JsonSerializable()
class ParkingPlaces {
  ParkingPlaces(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.radius,
      required this.transports});

  late int id;
  late double latitude;
  late double longitude;
  late double radius;
  late List<Transport> transports;

  factory ParkingPlaces.fromJson(Map<String, dynamic> data) =>
      _$ParkingPlacesFromJson(data);

  Map<String, dynamic> toJson() => _$ParkingPlacesToJson(this);
}
