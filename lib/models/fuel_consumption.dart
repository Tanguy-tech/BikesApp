class FuelConsumption {
  late final String id;
  late final String fuelType;
  late final double price;
  late final double pricePerLitter;
  late final double volume;
  late final DateTime date;
  late final double dashKm;

  FuelConsumption(
      {required this.id,
      required this.fuelType,
      required this.date,
      required this.price,
      required this.pricePerLitter,
      required this.volume,
      required this.dashKm});
}
