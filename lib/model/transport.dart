import 'package:json_annotation/json_annotation.dart';

part 'transport.g.dart';

@JsonSerializable()
class Transport {
  Transport(
      {required this.id,
      required this.name,
      required this.batteryLevel,
      required this.description,
      required this.mileage,
      required this.manufacturer,
      required this.free,
      required this.price});

  late int id;
  late String name;
  late int batteryLevel;
  late String description;
  late int mileage;
  late String manufacturer;
  late int price;
  late bool free;

  factory Transport.fromJson(Map<String, dynamic> data) =>
      _$TransportFromJson(data);

  Map<String, dynamic> toJson() => _$TransportToJson(this);
}
