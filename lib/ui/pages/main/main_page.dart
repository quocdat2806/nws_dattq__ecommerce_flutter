// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/socket/socket_io.dart';
import 'package:newware_final_project/ui/pages/cart/cart_page.dart';
import 'package:newware_final_project/ui/pages/home/home_page.dart';
import 'package:newware_final_project/ui/pages/main/main_cubit.dart';
import 'package:newware_final_project/ui/pages/main/widgets/bottomnavigation_item.dart';
import 'package:newware_final_project/ui/pages/notification/notification_page.dart';
import 'package:newware_final_project/ui/pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MainCubit(),
      child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        int? userId = state.user!.id;
        return MainPageChildState(
          userId: userId,
        );
      }),
    );
  }
}

class MainPageChildState extends StatefulWidget {
  final int? userId;

  const MainPageChildState({super.key, required this.userId});

  @override
  State<MainPageChildState> createState() => _MainPageChildStateState();
}

class _MainPageChildStateState extends State<MainPageChildState> {
  var socket;
  late MainCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<MainCubit>(context);
    socket = SocketIoConnect(mainCubit: _cubit, userId: widget.userId)
        .connectAndListen();
  }

  @override
  void dispose() {
    // _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: state.selectedIndex,
              children: const [
                HomePage(),
                CartPage(),
                NotificationPage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationItem(
                  pathIcon: AppImages.pathHomeIcon,
                  title: S.of(context).textHome,
                  onTabItem: _cubit.switchTap,
                  index: 0,
                  state: state,
                ),
                BottomNavigationItem(
                  pathIcon: AppImages.pathCartIcon,
                  title: S.of(context).textCart,
                  onTabItem: _cubit.switchTap,
                  index: 1,
                  state: state,
                ),
                BottomNavigationItem(
                  pathIcon: AppImages.pathNotifyIcon,
                  title: S.of(context).textNotify,
                  onTabItem: _cubit.switchTap,
                  index: 2,
                  state: state,
                  hasNotify: true,
                  quantityNotify: state.couterNotify,
                  clearNotifyFun: _cubit.clearNotify,
                ),
                BottomNavigationItem(
                  pathIcon: AppImages.pathProfileIcon,
                  title: S.of(context).textProfile,
                  onTabItem: _cubit.switchTap,
                  index: 3,
                  state: state,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
