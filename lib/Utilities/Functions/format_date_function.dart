import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // Parse the date string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the date as 'Aug 30 2024' and the time as '12:30pm'
  String formattedDate = DateFormat('MMM dd yyyy').format(dateTime);
  String formattedTime = DateFormat('h:mma').format(dateTime).toLowerCase();

  return '$formattedDate, $formattedTime';
}

String formatDate(String dateTimeString) {
  // Parse the date string into a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Format the date as 'Aug 30 2024' and the time as '12:30pm'
  String formattedDate = DateFormat('MMM dd yyyy').format(dateTime);
  String formattedTime = DateFormat('h:mma').format(dateTime).toLowerCase();

  return '$formattedDate';
}

String formatTime(String time) {
  try {
    DateTime parsedTime = DateTime.parse(time);
    // Format time to 12-hour format with am/pm
    return DateFormat('hh:mma').format(parsedTime).toLowerCase();
  } catch (e) {
    return "Invalid time format";
  }
}

String convertFromDateTime(String input) {
  try {
    // Extract the date and "From" time
    RegExp regex = RegExp(r'(\w{3} \d{1,2} \d{4}), (\d{1,2}:\d{2}[APM]{2})');
    Match? match = regex.firstMatch(input);

    if (match != null) {
      String datePart = match.group(1)!; // "Mar 28 2025"
      String timePart = match.group(2)!; // "05:43PM"

      // Parse the date
      DateTime date = DateFormat("MMM d yyyy").parse(datePart);

      // Parse the time in 12-hour format
      DateTime time = DateFormat("hh:mma").parse(timePart);

      // Combine date and time
      DateTime finalDateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);

      // Format into "yyyy-MM-dd HH:mm"
      return DateFormat("yyyy-MM-dd HH:mm").format(finalDateTime);
    }
    return "Invalid format";
  } catch (e) {
    return "Error: $e";
  }
}

String convertToDateTime(String input) {
  try {
    // Extract the date and "To" time
    RegExp regex = RegExp(
        r'(\w{3} \d{1,2} \d{4}), \d{1,2}:\d{2}[APM]{2} - (\d{1,2}:\d{2}[APM]{2})');
    Match? match = regex.firstMatch(input);

    if (match != null) {
      String datePart = match.group(1)!; // "Mar 28 2025"
      String timePart = match.group(2)!; // "07:43PM"

      // Parse the date
      DateTime date = DateFormat("MMM d yyyy").parse(datePart);

      // Parse the time in 12-hour format
      DateTime time = DateFormat("hh:mma").parse(timePart);

      // Combine date and time
      DateTime finalDateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);

      // Format into "yyyy-MM-dd HH:mm"
      return DateFormat("yyyy-MM-dd HH:mm").format(finalDateTime);
    }
    return "Invalid format";
  } catch (e) {
    return "Error: $e";
  }
}

String formatTimeRangeFromString(String dateTimeString) {
  final dateTime = DateTime.parse(dateTimeString);

  final startTime = TimeOfDay.fromDateTime(dateTime);
  final endTime = startTime.replacing(hour: (startTime.hour + 2) % 24);

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute$period';
  }

  return '${formatTime(startTime)} - ${formatTime(endTime)}';
}
