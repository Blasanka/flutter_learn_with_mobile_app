import 'package:flutter/material.dart';

class StudentClass extends StatelessWidget {
  const StudentClass({
    Key? key,
    required this.classTeacher,
    required this.principal,
  }) : super(key: key);

  final String classTeacher;
  final String principal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 13.0,
          height: 13.0,
          decoration: new BoxDecoration(
            color: classTeacher == '-' ? Colors.red : Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
        Text(
          '$classTeacher  $principal',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
