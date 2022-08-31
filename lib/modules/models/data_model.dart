class DataModel {
  String? epochTime;
  String? pH;
  String? tds;
  String? temperature;
  String? turbidity;

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
      epochTime: json['Epoch timestamp'].toString(),
      pH: json['pH'].toString(),
      tds: json['tds'].toString(),
      temperature: json['temperature'].toString(),
      turbidity: json['turbidity'].toString(),
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
