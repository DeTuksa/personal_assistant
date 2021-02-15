import 'dart:math';

class NotesModel {
  int id;
  String title;
  String content;
  DateTime date;

  NotesModel({this.title, this.date, this.id, this.content});

  NotesModel.fromMap(Map<String, dynamic> map) {
    this.id = map['_id'];
    this.title = map['title'];
    this.content = map['content'];
    this.date = DateTime.parse(map['date']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': this.id,
      'title': this.title,
      'content': this.content,
      'date': this.date.toIso8601String(),
    };
  }

  NotesModel.random() {
    this.id = Random(10).nextInt(1000) + 1;
    this.title = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
    this.content = 'Lorem Ipsum ' * (Random().nextInt(4) + 1);
    this.date = DateTime.now().add(Duration(hours: Random().nextInt(100)));
  }
}