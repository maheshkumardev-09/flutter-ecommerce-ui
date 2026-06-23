class AddressModel {
  final String type;
  final String fullAddress;
  final String icon;

  final double? latitude;
  final double? longitude;

  AddressModel({
    required this.type,
    required this.fullAddress,
    required this.icon,
    this.latitude,
    this.longitude,
  });
}
