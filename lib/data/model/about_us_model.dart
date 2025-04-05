import 'dart:convert';

class AboutUsModel {
    final ContentData contentData;

    AboutUsModel({
        required this.contentData,
    });

    AboutUsModel copyWith({
        ContentData? contentData,
    }) => 
        AboutUsModel(
            contentData: contentData ?? this.contentData,
        );

    factory AboutUsModel.fromJson(String str) => AboutUsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AboutUsModel.fromMap(Map<String, dynamic> json) => AboutUsModel(
        contentData: ContentData.fromMap(json["ContentData"]),
    );

    Map<String, dynamic> toMap() => {
        "ContentData": contentData.toMap(),
    };
}

class ContentData {
    final String contentId;
    final String contentTitle;
    final String content;
    final int ack;
    final String msg;

    ContentData({
        required this.contentId,
        required this.contentTitle,
        required this.content,
        required this.ack,
        required this.msg,
    });

    ContentData copyWith({
        String? contentId,
        String? contentTitle,
        String? content,
        int? ack,
        String? msg,
    }) => 
        ContentData(
            contentId: contentId ?? this.contentId,
            contentTitle: contentTitle ?? this.contentTitle,
            content: content ?? this.content,
            ack: ack ?? this.ack,
            msg: msg ?? this.msg,
        );

    factory ContentData.fromJson(String str) => ContentData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContentData.fromMap(Map<String, dynamic> json) => ContentData(
        contentId: json["content_id"],
        contentTitle: json["content_title"],
        content: json["content"],
        ack: json["Ack"],
        msg: json["msg"],
    );

    Map<String, dynamic> toMap() => {
        "content_id": contentId,
        "content_title": contentTitle,
        "content": content,
        "Ack": ack,
        "msg": msg,
    };
}
