class DataModel {
  int? epochTime;
  double? pH;
  double? tds;
  double? temperature;
  double? turbidity;

  DataModel({
    this.epochTime,
    this.pH,
    this.tds,
    this.temperature,
    this.turbidity,
  });

  // from json
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      epochTime: json['timestamp'] ?? "",
      pH: json['pH'] ?? "",
      tds: json['tds'] ?? "",
      temperature: json['temperature'] ?? "",
      turbidity: json['turbidity'] ?? "",
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'epochTime': epochTime,
      'pH': pH,
      'tds': tds,
      'temperature': temperature,
      'turbidity': turbidity,
    };
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'epochTime': epochTime,
      'pH': pH,
      'tds': tds,
      'temperature': temperature,
      'turbidity': turbidity,
    };
  }
}
