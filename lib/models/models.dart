import 'dart:convert';

class Note {
  String id;
  String title;
  String body;
  String date;
  String updated;

  Note({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.updated,
  });

  Note copyWith({
    String? id,
    String? title,
    String? body,
    String? date,
    String? updated,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        date: date ?? this.date,
        updated: updated ?? this.updated,
      );

  factory Note.fromRawJson(String str) => Note.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        date: json["date"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "date": date,
        "updated": updated,
      };
}

class AppState {
  final List<Note> notes;

  AppState({required this.notes});

  AppState.initialState() : notes = List.unmodifiable(<Note>[]);

  AppState.fromJson(Map json)
      : notes = (json['notes'] as List).map((i) => Note.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {"notes": notes};
}
