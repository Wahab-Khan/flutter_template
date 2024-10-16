List<PostsModel> postModelFromData(dynamic data) =>
    List<PostsModel>.from(data.map((x) => PostsModel.fromMap(x)));

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

//<editor-fold desc="Data Methods">
  PostsModel({
    this.userId,
    this.id,
    this.title,
    required this.body,
  });

  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     (other is PostsModel &&
  //         runtimeType == other.runtimeType &&
  //         userID == other.userID &&
  //         id == other.id &&
  //         title == other.title &&
  //         body == other.body);
  //
  // @override
  // int get hashCode =>
  //     userID.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;

  // @override
  // String toString() {
  //   return 'PostsModel{' +
  //       ' userID: $userID,' +
  //       ' id: $id,' +
  //       ' title: $title,' +
  //       ' body: $body,' +
  //       '}';
  // }

  PostsModel copyWith({
    int? userID,
    int? id,
    String? title,
    String? body,
  }) {
    return PostsModel(
      userId: userID ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

//</editor-fold>
}
