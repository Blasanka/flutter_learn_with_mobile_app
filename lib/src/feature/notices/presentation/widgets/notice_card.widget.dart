import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/presentation/widgets/universal_network_image.widget.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';

class NoticeCardWidget extends StatelessWidget {
  final Notice notice;

  NoticeCardWidget({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      elevation: .5,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              children: [
                CircleAvatar(radius: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Posted by Amritha", style: Theme.of(context).textTheme.subtitle1,),
                    Text("20th March 2021", style: Theme.of(context).textTheme.subtitle2,),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: UniversalNetworkImage(imageUrl: notice.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(child: Text(notice.title ?? "", style: Theme.of(context).textTheme.headline6,)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Row(
              children: [
                Expanded(child: Text(notice.description ?? "", style: Theme.of(context).textTheme.subtitle1,)),
              ],
            ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
