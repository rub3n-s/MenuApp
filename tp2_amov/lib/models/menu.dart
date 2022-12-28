// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
  });

  Day monday;
  Day tuesday;
  Day wednesday;
  Day thursday;
  Day friday;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        monday: Day.fromJson(json["MONDAY"]),
        tuesday: Day.fromJson(json["TUESDAY"]),
        wednesday: Day.fromJson(json["WEDNESDAY"]),
        thursday: Day.fromJson(json["THURSDAY"]),
        friday: Day.fromJson(json["FRIDAY"]),
      );

  Map<String, dynamic> toJson() => {
        "MONDAY": monday.toJson(),
        "TUESDAY": tuesday.toJson(),
        "WEDNESDAY": wednesday.toJson(),
        "THURSDAY": thursday.toJson(),
        "FRIDAY": friday.toJson(),
      };
}

class Day {
  Day({
    required this.original,
    required this.update,
  });

  Original original;
  dynamic update;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        original: Original.fromJson(json["original"]),
        update: json["update"],
      );

  Map<String, dynamic> toJson() => {
        "original": original.toJson(),
        "update": update,
      };
}

class Original {
  Original({
    required this.img,
    required this.weekDay,
    required this.soup,
    required this.fish,
    required this.meat,
    required this.vegetarian,
    required this.desert,
  });

  dynamic img;
  String weekDay;
  String soup;
  String fish;
  String meat;
  String vegetarian;
  String desert;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        img: json["img"],
        weekDay: json["weekDay"],
        soup: json["soup"],
        fish: json["fish"],
        meat: json["meat"],
        vegetarian: json["vegetarian"],
        desert: json["desert"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "weekDay": weekDay,
        "soup": soup,
        "fish": fish,
        "meat": meat,
        "vegetarian": vegetarian,
        "desert": desert,
      };
}
