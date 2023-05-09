// To parse this JSON data, do
//
//     final detailsModel = detailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DetailsModel detailsModelFromJson(String str) => DetailsModel.fromJson(json.decode(str));

String detailsModelToJson(DetailsModel data) => json.encode(data.toJson());

class DetailsModel {
    final List<Datum> data;

    DetailsModel({
        required this.data,
    });

    factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final int id;
    final String userName;
    final String petName;
    final String petImage;
    final bool isFriendly;

    Datum({
        required this.id,
        required this.userName,
        required this.petName,
        required this.petImage,
        required this.isFriendly,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["userName"],
        petName: json["petName"],
        petImage: json["petImage"],
        isFriendly: json["isFriendly"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "petName": petName,
        "petImage": petImage,
        "isFriendly": isFriendly,
    };
}
