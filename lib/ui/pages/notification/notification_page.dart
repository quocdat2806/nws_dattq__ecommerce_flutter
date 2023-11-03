import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/notification/notification_cubit.dart';
import 'package:newware_final_project/ui/pages/notification/notification_state.dart';
import 'package:newware_final_project/ui/pages/notification/widgets/notification_item.dart';
import 'package:newware_final_project/ui/widget/header_action/header_action.dart';
import 'package:newware_final_project/ui/widget/loading/circular_loading.dart';
import 'package:newware_final_project/utils/app_date_utils.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final userRepo = RepositoryProvider.of<UserResponsitory>(context);
        return NotificationCubit(
          userRepo: userRepo,
        );
      },
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          // chỗ này em sử lí ở node js . và ở client
          // nếu cái cart ma > 2 thì hiển thị avatar ng dùng
          // nếu cart < 2 thì hiển thị ảnh đơn  hàng mua
          int? userId = state.user?.id;
          String? avatar = state.user?.avatar;
          return NotificationChildPage(
            userId: userId,
            avatar: avatar,
          );
        },
      ),
    );
  }
}

class NotificationChildPage extends StatefulWidget {
  final int? userId;
  final String? avatar;

  const NotificationChildPage({super.key, this.userId, this.avatar});

  @override
  State<NotificationChildPage> createState() => _NotificationChildPageState();
}

class _NotificationChildPageState extends State<NotificationChildPage> {
  late NotificationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<NotificationCubit>(context);
    _cubit.fetchNotify(widget.userId ?? 0);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 3),
          () {
            _cubit.fetchNotify(widget.userId ?? 0);
          },
        );
      },
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return state.fetchNotifyStatus == LoadStatus.loading
              ? const CircularLoading()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: HeaderAction(
                        iconRight: Container(
                          constraints: const BoxConstraints(
                            minHeight: 44,
                            minWidth: 44,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: AppStyles.iconSvgStyle(
                            pathImage: AppImages.pathMoreIcon,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          S.of(context).textNotify,
                          style: AppStyles.textStyle(
                            fontFamily: 'ExtraBold',
                            fontWeight: FontWeight.w900,
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ),
                    state.listNotificationEntity.isNotEmpty
                        ? const SizedBox.shrink()
                        : Center(
                            child: Text(
                              S.current.textNotifyEmpty,
                            ),
                          ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.listNotificationEntity.length,
                        itemBuilder: (context, index) {
                          var dateFormatter = state
                              .listNotificationEntity[index].createdAt
                              .toString()
                              .formattedTime;
                          String timeDiff =
                              DateDifferent().diffTime(dateFormatter);
                          String? idNotification =
                              state.listNotificationEntity[index].id;
                          String? pathImage =
                              state.listNotificationEntity[index].image ??
                                  widget.avatar;
                          return NotificationItem(
                            idNotification: idNotification,
                            pathImage: pathImage,
                            timeDiff: timeDiff,
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
