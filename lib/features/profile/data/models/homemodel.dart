import 'package:fullfluttersetup/features/profile/domain/entity/home.dart';

class CalendarModel extends Calendar {
  CalendarModel({
    required super.date,
    required super.present,
    required super.events,
    required super.id,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      id: json['id'] as String? ?? '',
      present: json['present'] as bool? ?? false,
      events: json['events'] != null
          ? (json['events'] as List<dynamic>)
              .map((e) => EventEntityModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      date: json['date'] as String? ?? '',
    );
  }
}

class EventEntityModel extends EventEntity {
  EventEntityModel({
    required super.inTime,
    required super.outTime,
    required super.type,
  });

  factory EventEntityModel.fromJson(Map<String, dynamic> json) {
    return EventEntityModel(
      inTime: json['inTime'] as String? ?? '',
      outTime: json['outTime'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );
  }
}
