import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/providers/student_list.provider.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/widgets/badge.widget.dart';

class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return buildStudentProfile(context);
  }

  Widget buildStudentProfile(BuildContext context) {
    Student student = context.watch<StudentProvider>().students.first;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: student.id,
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.height / 9,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(student.imageUrl),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "${student.id}000L",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  // StudentClass(
                  //   classTeacher: student.classTeacher,
                  //   principal: student.principal,
                  // ),
                ],
              ),
            ],
          ),
          SizedBox(height: 34),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SvgPicture.asset(
                      "assets/images/profile/boss.svg",
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    )),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "principal")!,
                      style: Theme.of(context).textTheme.subtitle1),
                  Text(student.principal,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/gender-symbols.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "gender")!, style: Theme.of(context).textTheme.subtitle1),
                  Text(student.gender,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/map.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "location")!,
                      style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    child: Text(student.location.name,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/real-estate.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "address")!, style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Badge(text: student.address.street),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/phone-receiver.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "classTeacherContact")!, style: Theme.of(context).textTheme.subtitle1),
                  Text(student.type == "" ? '-' : student.type,
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/class-room.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "grade")!, style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    width: 120,
                    child: Text(student.grade,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SvgPicture.asset(
                    "assets/images/profile/education.svg",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated(context, "classTeacher")!,
                      style: Theme.of(context).textTheme.subtitle1),
                  FirstSeenIn(
                            name: student.address.street,
                            address: student.address.suite,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstSeenIn extends StatelessWidget {
  const FirstSeenIn({
    Key? key,
    required this.address,
    required this.name,
  }) : super(key: key);

  final String address;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: Theme.of(context).textTheme.headline6),
        Badge(text: address)
      ],
    );
  }
}
