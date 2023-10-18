import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/entities/notification/notification_entity.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class NotificationState extends Equatable {
  final List<NotificationEntity> notificationEntity;
  final LoadStatus fetchNotifyStatus;
  const NotificationState({
    this.notificationEntity = const [],
    this.fetchNotifyStatus = LoadStatus.initial,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [notificationEntity,fetchNotifyStatus];

  NotificationState copyWith({
    List<NotificationEntity>? notificationEntity,
    LoadStatus? fetchNotifyStatus,
  }) {
    return NotificationState(
      notificationEntity: notificationEntity ?? this.notificationEntity,
      fetchNotifyStatus: fetchNotifyStatus ?? this.fetchNotifyStatus,
    );
  }
}
