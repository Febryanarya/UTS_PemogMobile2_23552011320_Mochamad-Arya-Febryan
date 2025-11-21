class ProductModel {
  final int id;
  final String name;
  final int price;
  final String image;

  // tambahan field bonus
  final String truckType;        // contoh: "Trailer", "Box", "Pickup"
  final int capacityTon;         // kapasitas angkut (Ton)
  final String plateNumber;      // nomor polisi truk

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.truckType,
    required this.capacityTon,
    required this.plateNumber,
  });
}
