import 'package:device_calendar/device_calendar.dart' as device_calendar;

import 'package:dev_toolkit/extensions/bool_extensions.dart';
import 'package:dev_toolkit/extensions/list_extensions.dart';
import 'package:dev_toolkit/extensions/string_extensions.dart';

abstract class DeviceCalendarService {
  Future<bool?> addOrUpdateEvent({
    required String title,
    String? description,
    required DateTime start,
    required DateTime end,
  });
}

class DeviceCalendarServiceImpl implements DeviceCalendarService {
  final device_calendar.DeviceCalendarPlugin _deviceCalendarPlugin =
      device_calendar.DeviceCalendarPlugin();
  device_calendar.TZDateTime _toTZDateTime(DateTime dateTime) {
    final offsetDateTime = dateTime.toUtc();

    return device_calendar.TZDateTime.utc(
      offsetDateTime.year,
      offsetDateTime.month,
      offsetDateTime.day,
      offsetDateTime.hour,
      offsetDateTime.minute,
    );
  }

  Future<bool?> addOrUpdateEvent({
    required String title,
    String? description,
    required DateTime start,
    required DateTime end,
    void Function()? onPermissionDenied,
  }) async {
    final permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
    if (!permissionsGranted.isSuccess || !(permissionsGranted.data ?? false)) {
      onPermissionDenied?.call();
      return null;
    }

    // Get calendars
    final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
    if (!calendarsResult.isSuccess || calendarsResult.data == null) {
      return false;
    }

    final calendarId = calendarsResult.data
        ?.firstOrDefault((calendar) => !calendar.isReadOnly.value)
        ?.id; // Use first available calendar

    final eventStart = _toTZDateTime(start);
    final eventEnd = _toTZDateTime(end);

    final eventsResult = await _deviceCalendarPlugin.retrieveEvents(
      calendarId,
      device_calendar.RetrieveEventsParams(
        startDate: eventStart,
        endDate: eventEnd,
      ),
    );

    final existingEvent =
        eventsResult.data?.firstOrDefault((event) => event.title == title);

    final eventId = existingEvent?.eventId;

    final event = device_calendar.Event(
      calendarId.value,
      eventId: eventId,
      reminders: [device_calendar.Reminder(minutes: 15)],
      title: title,
      description: description,
      start: eventStart,
      end: eventEnd,
    );

    final createEventResult =
        await _deviceCalendarPlugin.createOrUpdateEvent(event);

    return (createEventResult?.isSuccess).value;
  }
}
