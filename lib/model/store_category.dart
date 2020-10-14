class StoreCategoryModel {
  final String image;
  final String display_order;
  final int id;
  final String name;
  const StoreCategoryModel(
      {this.image, this.display_order, this.id, this.name});

  StoreCategoryModel.fromMap(Map<String, dynamic> map)
      : image = map['image'].toString(),
        display_order = map['display_order'].toString(),
        id = map['id'],
        name = map['name'].toString();
}
