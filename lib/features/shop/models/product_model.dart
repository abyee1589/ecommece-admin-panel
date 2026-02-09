class ProductModel {
  final String id;
  final String name;
  final String image;

  ProductModel({required this.id, required this.name, required this.image});

  static ProductModel empty() => ProductModel(id: '', name: '', image: '');
}