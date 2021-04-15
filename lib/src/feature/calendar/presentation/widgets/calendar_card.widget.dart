import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';

class CalendarCardWidget extends StatelessWidget {
  final Event event;

  CalendarCardWidget({required this.event});

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.parse(event.dateTime!);
    int daysLeft = DateTime.now().difference(dt).inDays;
    Color color = Colors.white;
    Color lineColor = Colors.white.withAlpha(40);
    if (daysLeft <= 1) {
      color = Color(0xFFfff1f1);
      lineColor = Color(0xFFeee3e3);
    } else if (daysLeft > 3) {
      color = Color(0xFFe5f7f8);
      lineColor = Color(0xFF2bc8d8);
    } else if (daysLeft > 5) {
      color = Colors.amberAccent.withOpacity(.5);
      lineColor = Colors.amberAccent.withOpacity(.7);
    }
    String formattedDate = DateFormat("dd-MM-yyyy hh:mm a").format(dt);
    return Card(
      elevation: 0.2,
      color: color,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 129,
            decoration: BoxDecoration(
              color: lineColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                topLeft: Radius.circular(4),
              )
            ),
          ),
          if (daysLeft == 0)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Today",
                  style: Theme.of(context).textTheme.headline6,
                ),
            ),
          if (daysLeft == 1)
            buildDaysLeftWidget(daysLeft, "Day", context),
          if (daysLeft > 1)
            buildDaysLeftWidget(daysLeft, "Days", context),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                event.message ?? "",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                event.details ?? "",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 4),
              Text(
                formattedDate,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.kLighterGrey,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildDaysLeftWidget(int daysLeft, String daysLabel, BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "$daysLeft",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  daysLabel,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
  }
}
