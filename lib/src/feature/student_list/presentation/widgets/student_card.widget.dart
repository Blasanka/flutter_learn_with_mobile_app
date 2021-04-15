import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:srp_parent_mobile/src/core/constants/app_assets_paths.dart';
import 'package:srp_parent_mobile/src/core/constants/dimensions.dart';
import 'package:srp_parent_mobile/src/core/route/route.constants.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_address.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_location.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_profile/presentation/screens/student_profile.screen.dart';
import 'package:srp_parent_mobile/src/feature/student_profile/presentation/widgets/student_class.widget.dart';

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard(this.student);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          RouteConstants.mainScreen,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          type: MaterialType.card,
          elevation: 4.0,
          color: Theme.of(context).primaryColorDark,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    topLeft: const Radius.circular(10.0),
                  ),
                  child: Container(
                    height: Dimensions.studentCardHeight,
                    child: Hero(
                      tag: student.id,
                      child: ProgressiveImage(
                        placeholder: AssetImage(
                          AppAssetPaths.blurImage,
                        ),
                        thumbnail: AssetImage(
                          AppAssetPaths.blurImage,
                        ),
                        width: Dimensions.stCardImgWidth,
                        height: Dimensions.stCardImgHeight,
                        image: NetworkImage(
                          student.imageUrl,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: _StudentDescription(
                  name: student.name,
                  classTeacher: student.classTeacher,
                  principal: student.principal,
                  gender: student.gender,
                  address: student.address,
                  location: student.location,
                  grade: student.principal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudentDescription extends StatelessWidget {
  const _StudentDescription({
    Key? key,
    this.name,
    this.classTeacher,
    this.principal,
    this.gender,
    this.address,
    this.location,
    this.grade,
  }) : super(key: key);

  final String? name;
  final String? classTeacher;
  final String? principal;
  final String? gender;
  final Address? address;
  final String? grade;
  final StudentLocation? location;

  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      Text(
        name ?? '',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline4,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
      StudentClass(classTeacher: classTeacher ?? '', principal: principal ?? ''),
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Text(
        'Principal',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
      Text(
        '${location!.name}',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Text(
        'Class Teacher',
        style: Theme.of(context).textTheme.bodyText2,
      ),
      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
      Text(
        '${address!.street}',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children2,
      ),
    );
  }
}
