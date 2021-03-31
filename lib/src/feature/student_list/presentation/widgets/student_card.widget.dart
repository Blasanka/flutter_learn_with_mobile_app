import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:srp_parent_mobile/src/core/constants.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/student_episode.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/student_location.entity.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/widgets/status_spicies.widget.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/screens/student_detail.screen.dart';

class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard(this.student);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StudentDetailScreen(student)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          type: MaterialType.card,
          elevation: 4.0,
          color: kLightGrey,
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
                    height: 170,
                    child: Hero(
                      tag: student.id,
                      child: ProgressiveImage(
                        placeholder: AssetImage(
                          'assets/images/blur-image.png',
                        ),
                        thumbnail: AssetImage(
                          'assets/images/blur-image.png',
                        ),
                        width: 180,
                        height: 170,
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
                  status: student.status,
                  species: student.species,
                  gender: student.gender,
                  address: student.address,
                  location: student.location,
                  origin: student.origin,
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
    this.status,
    this.species,
    this.gender,
    this.address,
    this.location,
    this.origin,
  }) : super(key: key);

  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final Address? address;
  final String? origin;
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
      StatusSpecies(status: status ?? '', species: species ?? ''),
      const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
      Text(
        'Last known location',
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
        'First seen in',
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
