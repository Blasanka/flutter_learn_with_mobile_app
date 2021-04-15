import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';

class NoticeModel extends Notice {
  NoticeModel({
    required int id,
    String? title,
    String? description,
    String? imageUrl,
  }) : super(
    id: id,
    title: title,
    description: description,
    imageUrl: imageUrl,
  );
}
