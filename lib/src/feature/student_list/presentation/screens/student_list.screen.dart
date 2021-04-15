import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/widgets/app_bar.widget.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/providers/student_list.provider.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/widgets/student_card.widget.dart';
import 'package:provider/provider.dart';

class StudentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<StudentProvider>(context, listen: false);
    return FutureBuilder(
      future: provider.fetchStudent(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBarWidget(
            title: getTranslated(context, 'dashboardTitle') ?? "",
            actions: <Widget>[
              InkWell(
                onTap: () async {
                  await provider.fetchStudent();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.refresh, size: 30.0),
                ),
              )
            ],
          ),
            body: provider.state == ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : provider.state == ViewState.Error
                    ? Center(
                        child: Text(getTranslated(context, 'somethingWrong') ?? ""),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: provider.students.length,
                        itemBuilder: (BuildContext context, int index) {
                          return provider.students
                              .map((ch) => StudentCard(ch))
                              .toList()[index];
                        },
                      ),
        );
      }
    );
  }
}
