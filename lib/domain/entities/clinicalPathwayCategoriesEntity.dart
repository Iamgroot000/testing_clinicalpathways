import 'dart:convert';

ClinicalPathwayCategoriesItem clinicalPathwayCategoriesItemFromJson(String str) =>
    ClinicalPathwayCategoriesItem.fromJson(json.decode(str));

String clinicalPathwayCategoriesItemToJson(ClinicalPathwayCategoriesItem data) =>
    json.encode(data.toJson());


List<ClinicalPathwayCategoriesItem> ageGroupItemListFromJson(str) =>
    List<ClinicalPathwayCategoriesItem>.from((str).map((x) => ClinicalPathwayCategoriesItem.fromJson(x.data())));


class ClinicalPathwayCategoriesItem {
  List<String> categoryList;

  ClinicalPathwayCategoriesItem({
    required this.categoryList,
  });

  factory ClinicalPathwayCategoriesItem.fromJson(Map<String, dynamic> json) => ClinicalPathwayCategoriesItem(
    categoryList: List<String>.from(json["categoryList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "categoryList": List<dynamic>.from(categoryList.map((x) => x)),
  };
}