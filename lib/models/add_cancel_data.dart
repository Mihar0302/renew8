class AddCancelData {
  final List data;

  AddCancelData({required this.data});

  factory AddCancelData.fromJson(Map json) => AddCancelData(
        data: json["data"] ?? [],
      );
}

class Data {
  Data();

  factory Data.fromJson(Map json) => Data();
}
