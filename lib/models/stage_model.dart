class StageData {
  final List data;

  StageData({required this.data});

  factory StageData.fromJson(Map json) => StageData(
        data: json["data"] ?? [],
      );
}
