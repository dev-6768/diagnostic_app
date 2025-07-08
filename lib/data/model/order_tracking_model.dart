class TrackDataModel {
  final List<TrackData> trackData;
  final int ack;
  final String msg;

  TrackDataModel({
    required this.trackData,
    required this.ack,
    required this.msg,
  });

  factory TrackDataModel.fromMap(Map<String, dynamic> map) {
    return TrackDataModel(
      trackData: List<TrackData>.from(
        (map['TrackData'] ?? []).map((x) => TrackData.fromMap(x)),
      ),
      ack: map['Ack'] ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TrackData': trackData.map((x) => x.toMap()).toList(),
      'Ack': ack,
      'msg': msg,
    };
  }

  TrackDataModel copyWith({
    List<TrackData>? trackData,
    int? ack,
    String? msg,
  }) {
    return TrackDataModel(
      trackData: trackData ?? this.trackData,
      ack: ack ?? this.ack,
      msg: msg ?? this.msg,
    );
  }
}

class TrackData {
  final String message;

  TrackData({
    required this.message,
  });

  factory TrackData.fromMap(Map<String, dynamic> map) {
    return TrackData(
      message: map['message'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  TrackData copyWith({
    String? message,
  }) {
    return TrackData(
      message: message ?? this.message,
    );
  }
}
