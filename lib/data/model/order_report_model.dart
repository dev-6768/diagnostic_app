class ReportDataModel {
  final List<ReportData> reportData;
  final int ack;
  final String msg;

  ReportDataModel({
    required this.reportData,
    required this.ack,
    required this.msg,
  });

  factory ReportDataModel.fromMap(Map<String, dynamic> map) {
    return ReportDataModel(
      reportData: List<ReportData>.from(
        (map['ReportData'] ?? []).map((x) => ReportData.fromMap(x)),
      ),
      ack: map['Ack'] ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ReportData': reportData.map((x) => x.toMap()).toList(),
      'Ack': ack,
      'msg': msg,
    };
  }

  ReportDataModel copyWith({
    List<ReportData>? reportData,
    int? ack,
    String? msg,
  }) {
    return ReportDataModel(
      reportData: reportData ?? this.reportData,
      ack: ack ?? this.ack,
      msg: msg ?? this.msg,
    );
  }
}

class ReportData {
  final String reportId;
  final String report;

  ReportData({
    required this.reportId,
    required this.report,
  });

  factory ReportData.fromMap(Map<String, dynamic> map) {
    return ReportData(
      reportId: map['report_id'] ?? '',
      report: map['report'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'report_id': reportId,
      'report': report,
    };
  }

  ReportData copyWith({
    String? reportId,
    String? report,
  }) {
    return ReportData(
      reportId: reportId ?? this.reportId,
      report: report ?? this.report,
    );
  }
}
