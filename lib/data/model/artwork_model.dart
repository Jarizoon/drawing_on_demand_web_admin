class ArtworkModel {
  final String? title, price, pieces, inStock, description, category, surface, material, createdBy, status;
  final List<String>? image;
  final double? rating;
  ArtworkModel({
     this.image,
     this.title,
     this.price,
     this.category,
     this.status,
     this.createdBy,
     this.description,
     this.inStock,
     this.material,
     this.pieces,
     this.surface,
     this.rating
  });
}