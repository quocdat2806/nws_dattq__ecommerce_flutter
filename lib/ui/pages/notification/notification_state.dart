import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class NotificationState extends Equatable {
  final List<NotificationEntity> listNotificationEntity;
  final LoadStatus fetchNotifyStatus;
  const NotificationState({
    this.listNotificationEntity = const [],
    this.fetchNotifyStatus = LoadStatus.initial,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [listNotificationEntity,fetchNotifyStatus];

  NotificationState copyWith({
    List<NotificationEntity>? listNotificationEntity,
    LoadStatus? fetchNotifyStatus,
  }) {
    return NotificationState(
      listNotificationEntity: listNotificationEntity ?? this.listNotificationEntity,
      fetchNotifyStatus: fetchNotifyStatus ?? this.fetchNotifyStatus,
    );
  }
}
