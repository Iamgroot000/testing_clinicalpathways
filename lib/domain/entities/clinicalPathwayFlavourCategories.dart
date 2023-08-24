import 'dart:convert';

import 'package:testing_clinicalpathways/presentation/views/presentationLayerConnectors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'genderGroupsStandard.dart';

FlavourItem flavourFromJson(String str) =>
    FlavourItem.fromJson(json.decode(str));

String flavourToJson(AgeGroupItem data) => json.encode(data.toJson());

List<FlavourItem> FlavourItemListFromJson(str) =>
    List<FlavourItem>.from((str).map((x) => FlavourItem.fromJson(x.data())));

List<FlavourItem> FlavourItemListFromMap(List<dynamic> flavourList) {
  return flavourList
      .map<FlavourItem>((map) => FlavourItem.fromJson(map))
      .toList();
}

String flavourItemListToJson(List<FlavourItem> flavourItemList) {
  final List<Map<String, dynamic>> jsonData =
  flavourItemList.map((item) => item.toJson()).toList();
  final Map<String, dynamic> jsonMap = {"flavourList": jsonData};
  return json.encode(jsonMap);
}

class FlavourItem {
  DocumentReference<Object?>? reference;
  bool? isMandatory;
  String? groupName;
  AgeGroupItem? ageGroup;
  GenderGroupStandardItem? genderGroupStandard;

  FlavourItem({
    this.isMandatory =false,
    this.groupName = '',
    this.ageGroup,
    this.genderGroupStandard,
  });


  factory FlavourItem.fromJson(Map<String, dynamic> json) {
    FlavourItem item =FlavourItem(
      isMandatory:json["isMandatory"]!=null ? json["isMandatory"].toString().compareTo('true') ==0 : false,
    );
    return item;
  }


  @override
  String toString() {
    return toJson().toString();
  }

  Map<String, dynamic> toJson() => {
    'isMandatory': isMandatory,
    "groupName": groupName,
    "ageGroup": ageGroup ,
    "gender" : genderGroupStandard,
  };

  FlavourItem.fromMap(map, {this.reference}) {
    groupName = map['groupName'];

  }

  Map<String, dynamic> toMap() {
    return {
      'groupName': groupName,
    };
  }

  FlavourItem.fromSnapshot(QueryDocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);
}
