class TaskModel {
  final String id;
  final String title;
  final String note;
  final String starttime;
  final String endtime;
  final bool isCompleted;
  final int color;

  TaskModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.starttime,
      required this.endtime,
      required this.isCompleted,
      required this.color});

  static List<TaskModel> tasklist = [
    TaskModel(
        id: '1',
        title: 'zyad',
        note: 'learn flutter',
        starttime: '9:33',
        endtime: '10:33',
        isCompleted: false,
        color: 2),
    TaskModel(
        id: '2',
        title: 'task',
        note: 'learn ML',
        starttime: '9:33',
        endtime: '10:33',
        isCompleted: true,
        color: 3)
  ];
}
