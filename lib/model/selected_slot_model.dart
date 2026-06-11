class SelectedSlotModel {
  final DateTime date;
  final String timeLabel;
  SelectedSlotModel({required this.date, required this.timeLabel});

  String get formatted {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} (${days[date.weekday - 1]}), $timeLabel';
  }
}