import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/ui/commons/show_confirm.dart';
import 'package:newware_final_project/ui/pages/profile/profile_cubit.dart';
import 'package:newware_final_project/ui/pages/profile/profile_navigator.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/form_infomation.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/setting.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/upload_image.dart';
import 'package:quickalert/quickalert.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        return ProfileCubit(
          navigator: ProfileNavigator(context: context),
          appCubit: RepositoryProvider.of<AppCubit>(context),
        );
      },
      child: const ProfileChildPageState(),
    );
  }
}

class ProfileChildPageState extends StatefulWidget {
  const ProfileChildPageState({super.key});

  @override
  State<ProfileChildPageState> createState() => _ProfileChildPageStateState();
}

class _ProfileChildPageStateState extends State<ProfileChildPageState> {
  late ProfileCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<ProfileCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UploadImage(
                      pathImage: state.user?.avatar,
                    ),
                    Information(
                      labelText: 'Name',
                      textHint: state.user?.name,
                    ),
                    const Information(
                      labelText: 'Age',
                      textHint: '22',
                    ),
                    Information(
                      labelText: 'Email',
                      textHint: state.user?.email,
                    ),
                    AppStyles.sizedBoxStyle(height: 25),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Setting',
                        style: AppStyles.textStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'ExtraBold',
                        ),
                      ),
                    ),
                    AppStyles.sizedBoxStyle(height: 15),
                    const Setting(),
                    AppStyles.sizedBoxStyle(),
                    InkWell(
                      onTap: () {
                        ConfirmAlert().showLogoutAlert(context, _cubit.singOut);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.secondaryColor,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_logout.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
