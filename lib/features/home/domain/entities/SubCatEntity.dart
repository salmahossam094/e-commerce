class SubCatEntity {
  SubCatEntity({
    this.data,
  });

  List<SubDataEntity>? data;
}

class SubDataEntity {
  SubDataEntity({
    this.id,
    this.name,
    this.slug,
    this.category,

  });

  String? id;
  String? name;
  String? slug;
  String? category;

}
