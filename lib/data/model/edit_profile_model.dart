class EditProfileModel {
  final int ack;
  final String msg;

  EditProfileModel({
    required this.ack,
    required this.msg,
  });

  /// Create a new instance from a Map
  factory EditProfileModel.fromMap(Map<String, dynamic> map) {
    return EditProfileModel(
      ack: map['Ack'] ?? 0,
      msg: map['msg'] ?? '',
    );
  }

  /// Convert the instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'Ack': ack,
      'msg': msg,
    };
  }

  /// Create a copy of the instance with modified fields
  EditProfileModel copyWith({
    int? ack,
    String? msg,
  }) {
    return EditProfileModel(
      ack: ack ?? this.ack,
      msg: msg ?? this.msg,
    );
  }

  /// Utility to check success
  bool get isSuccess => ack == 1;

  @override
  String toString() => 'EditProfileModel(ack: $ack, msg: $msg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EditProfileModel &&
        other.ack == ack &&
        other.msg == msg;
  }

  @override
  int get hashCode => ack.hashCode ^ msg.hashCode;
}
