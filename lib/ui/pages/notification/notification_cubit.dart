import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/notification/notification_navigator.dart';
import 'package:newware_final_project/ui/pages/notification/notification_state.dart';
class NotificationCubit extends Cubit<NotificationState> {
  final UserResponsitory userRepo;
  final NotificationNavigator navigator;

  NotificationCubit({
    required this.userRepo,
    required this.navigator
  }) : super(
    const NotificationState(),
  );
  void fetchNotify(int userId) async {
    emit(
      state.copyWith(fetchNotifyStatus: LoadStatus.loading),
    );
    try {
      final listNotify = await userRepo.getNotify(userId);
      if (listNotify != null) {
        emit(
          state.copyWith(
            fetchNotifyStatus: LoadStatus.success,
            listNotificationEntity: listNotify,
          ),
        );
      } else {
        emit(state.copyWith(fetchNotifyStatus: LoadStatus.failure),);
      }
    } catch (error) {
      emit(state.copyWith(fetchNotifyStatus: LoadStatus.failure),);
    }
  }
  void backPage(){
    navigator.pop();
  }


}

