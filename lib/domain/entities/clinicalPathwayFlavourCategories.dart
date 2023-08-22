import 'dart:convert';

ClinicalPathwayFlavourCategoriesItem clinicalPathwayFlavourCategoriesItemFromJson(String str) =>
    ClinicalPathwayFlavourCategoriesItem.fromJson(json.decode(str));

String clinicalPathwayFlavourCategoriesItemToJson(ClinicalPathwayFlavourCategoriesItem data) =>
    json.encode(data.toJson());


List<ClinicalPathwayFlavourCategoriesItem> ageGroupItemListFromJson(str) =>
    List<ClinicalPathwayFlavourCategoriesItem>.from((str).map((x) => ClinicalPathwayFlavourCategoriesItem.fromJson(x.data())));


class ClinicalPathwayFlavourCategoriesItem {
  List<String> flavourList;

  ClinicalPathwayFlavourCategoriesItem({
    required this.flavourList,
  });

  factory ClinicalPathwayFlavourCategoriesItem.fromJson(Map<String, dynamic> json) => ClinicalPathwayFlavourCategoriesItem(
    flavourList: List<String>.from(json["flavourList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "flavourList": List<dynamic>.from(flavourList.map((x) => x)),
  };
}