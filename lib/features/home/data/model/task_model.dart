class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;

  final int isCompleted;
  final int color;
  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    this.isCompleted = 0,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      color: json['color'],
      isCompleted: json['isCompleted'],
    );
  }
}
