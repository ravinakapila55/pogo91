class StoreCategory {
  final String image;
  final String display_order;
  final String id;
  final String name;
  const StoreCategory({this.image, this.display_order, this.id, this.name});

  StoreCategory.fromMap(Map<String, dynamic> map)
      : image = map['image'],
        display_order = map['display_order'],
        id = map['id'],
        name = map['name'];
}
