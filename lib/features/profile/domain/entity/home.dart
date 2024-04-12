class Calendar {
  const Calendar({
    required this.date,
    required this.present,
    required this.events,
    required this.id,
  });

  final String? date;
  final bool? present;
  final List<EventEntity> events;
  final String? id;
}

class EventEntity {
  const EventEntity({
    required this.inTime,
    required this.outTime,
    required this.type,
  });

  final String inTime;
  final String outTime;
  final String type;
}
