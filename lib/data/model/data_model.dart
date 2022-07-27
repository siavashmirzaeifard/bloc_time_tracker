import 'dart:convert';

List<DataModel> dataModelFromJson(String str) =>
    List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.timeframes,
    required this.title,
  });

  final Timeframes timeframes;
  final String title;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        timeframes: Timeframes.fromJson(json["timeframes"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "timeframes": timeframes.toJson(),
        "title": title,
      };
}

class Timeframes {
  Timeframes({
    required this.daily,
    required this.monthly,
    required this.weekly,
  });

  final Daily daily;
  final Monthly monthly;
  final Weekly weekly;

  factory Timeframes.fromJson(Map<String, dynamic> json) => Timeframes(
        daily: Daily.fromJson(json["daily"]),
        monthly: Monthly.fromJson(json["monthly"]),
        weekly: Weekly.fromJson(json["weekly"]),
      );

  Map<String, dynamic> toJson() => {
        "daily": daily.toJson(),
        "monthly": monthly.toJson(),
        "weekly": weekly.toJson(),
      };
}

class Daily {
  Daily({
    required this.current,
    required this.previous,
  });

  final int current;
  final int previous;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        current: json["current"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "previous": previous,
      };
}

class Weekly {
  Weekly({
    required this.current,
    required this.previous,
  });

  final int current;
  final int previous;

  factory Weekly.fromJson(Map<String, dynamic> json) => Weekly(
        current: json["current"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "previous": previous,
      };
}

class Monthly {
  Monthly({
    required this.current,
    required this.previous,
  });

  final int current;
  final int previous;

  factory Monthly.fromJson(Map<String, dynamic> json) => Monthly(
        current: json["current"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "previous": previous,
      };
}
