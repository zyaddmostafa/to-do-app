class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String starttime;
  final String endtime;
  final int isCompleted;
  final int color;
  final String date;

  TaskModel(
      {this.id,
      required this.title,
      required this.note,
      required this.starttime,
      required this.endtime,
      required this.isCompleted,
      required this.color,
      required this.date});

  factory TaskModel.fromjson(dynamic json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      starttime: json['starttime'],
      endtime: json['endtime'],
      isCompleted: json['iscompleted'],
      color: json['color'],
      date: json['date'],
    );
  }
}
