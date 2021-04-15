import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srp_parent_mobile/src/feature/notices/presentation/providers/notices.provider.dart';
import 'package:srp_parent_mobile/src/feature/notices/presentation/widgets/notice_card.widget.dart';

class NoticesScreen extends StatefulWidget {
  @override
  _NoticesScreenState createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {

  @override
  void initState() {
    context.read<NoticesProvider>().fetchNotices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var notices = context.watch<NoticesProvider>().notices;
    return ListView.builder(
      itemCount: notices.length,
      itemBuilder: (BuildContext context, int index) {
        return NoticeCardWidget(notice: notices[index]);
      },
    );
  }
}
