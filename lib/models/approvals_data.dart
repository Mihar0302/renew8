
class StageDataApproval {
  final List data;

  StageDataApproval({required this.data});

  factory StageDataApproval.fromJson(Map json) =>
      StageDataApproval(
        data: json["data"] ?? [],
      );
}

class ApprovalsData {
  final String id;
  final String date;
  final String quotationName;
  final List approvalList;

  ApprovalsData({
    required this.id,
    required this.date,
    required this.quotationName,
    required this.approvalList,
  });

  factory ApprovalsData.fromJson(Map json) => ApprovalsData(
        id: json["id"],
        date: json["created_at"],
        quotationName: json["quotation_name"],
        approvalList: ["approval_data"],
      );
}
