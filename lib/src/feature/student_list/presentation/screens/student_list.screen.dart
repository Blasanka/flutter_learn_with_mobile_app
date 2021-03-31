import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/base.view.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/providers/student_list.provider.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/widgets/student_card.widget.dart';

class StudentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<StudentProvider>(
      onModelReady: (model) => model.fetchStudent(),
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(getTranslated(context, 'dashboardTitle') ?? "",
                  style: Theme.of(context).textTheme.headline6),
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
                    itemCount: provider.student.length,
                    itemBuilder: (BuildContext context, int index) {
                      return provider.student
                          .map((ch) => StudentCard(ch))
                          .toList()[index];
                    },
                  ),
      ),
    );
  }
}
