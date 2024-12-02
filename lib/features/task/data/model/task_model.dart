class TaskModel {
  final String id;
  final String title;
  final String note;
  final String starttime;
  final String endtime;
  final bool isCompleted;
  final int color;
  final String date;

  TaskModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.starttime,
      required this.endtime,
      required this.isCompleted,
      required this.color,
      required this.date});
}
