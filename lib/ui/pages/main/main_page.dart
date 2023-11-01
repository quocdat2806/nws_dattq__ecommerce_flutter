// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/socket/socket_io.dart';
import 'package:newware_final_project/ui/pages/home/home_page.dart';
import 'package:newware_final_project/ui/pages/main/main_cubit.dart';
import 'package:newware_final_project/ui/pages/main/widgets/bottomnavigation_item.dart';
import 'package:newware_final_project/ui/pages/notification/notification_page.dart';
import 'package:newware_final_project/ui/pages/profile/profile_page.dart';
import 'package:newware_final_project/ui/pages/shop_cart/cart_page.dart';

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
      child: const MainPageChildState(),
    );
  }
}
class MainPageChildState extends StatefulWidget {
  const MainPageChildState({super.key});

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
    socket = SocketIoConnect(mainCubit: _cubit).connectAndListen();
  }

  @override
  void dispose() {
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
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 0,
            ),
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
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavigationItem(
                  pathIconNavigation: AppImages.pathHomeIcon,
                  title: S.of(context).textHome,
                  onTabItem: _cubit.switchTap,
                  index: 0,
                  isActivePage: state.selectedIndex==0,
                ),
                BottomNavigationItem(
                  pathIconNavigation: AppImages.pathCartIcon,
                  title: S.of(context).textCart,
                  onTabItem: _cubit.switchTap,
                  index: 1,
                  isActivePage: state.selectedIndex==1,

                ),
                BottomNavigationItem(
                  pathIconNavigation: AppImages.pathNotifyIcon,
                  title: S.of(context).textNotify,
                  onTabItem: _cubit.switchTap,
                  index: 2,
                  hasNotify: true,
                  isActivePage: state.selectedIndex==2,
                  quantityNotify: state.quantityNotify,
                  handleClearNotify: _cubit.clearNotify,
                ),
                BottomNavigationItem(
                  pathIconNavigation: AppImages.pathProfileIcon,
                  title: S.of(context).textProfile,
                  onTabItem: _cubit.switchTap,
                  isActivePage: state.selectedIndex==3,
                  index: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
