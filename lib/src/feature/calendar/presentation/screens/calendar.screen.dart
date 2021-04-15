import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/providers/calendar.provider.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/widgets/calendar_card.widget.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  @override
  void initState() {
    context.read<CalendarProvider>().fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var events = context.watch<CalendarProvider>().events;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        return CalendarCardWidget(event: events[index]);
      },
    );
  }
}
