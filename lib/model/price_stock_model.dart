class PriceStockModel {
  final String barcode;
  final String weight;

  final String id;
  final String variant_id;
  final String selling_price;
  final String name;
  final String mrp;
  final String added_quantity;
  final String quantity;

  const PriceStockModel(
      {this.barcode,
      this.weight,
      this.id,
      this.variant_id,
      this.selling_price,
      this.name,
      this.mrp,
      this.added_quantity,
      this.quantity});

  PriceStockModel.fromMap(Map<String, dynamic> map)
      : barcode = map['barcode'].toString(),
        weight = map['weight'].toString(),
        id = map['id'].toString(),
        variant_id = map['variant_id'].toString(),
        selling_price = map['selling_price'].toString(),
        name = map['name'].toString(),
        mrp = map['mrp'].toString(),
        added_quantity = map['added_quantity'].toString(),
        quantity = map['quantity'].toString();
}
