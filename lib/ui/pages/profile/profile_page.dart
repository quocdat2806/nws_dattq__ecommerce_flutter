import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/profile/profile_cubit.dart';
import 'package:newware_final_project/ui/pages/profile/profile_navigator.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/form_infomation.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/logout.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/setting.dart';
import 'package:newware_final_project/ui/pages/profile/widgets/upload_image.dart';

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
    return  BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 0,
            top: 0
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 24,
            ),
            child: Column(

              children: [
                const SizedBox(height: 24),
                UploadImage(
                  pathImage: state.user?.avatar,
                ),
                Information(
                  labelText: S.of(context).textName,
                  textHint: state.user?.name,
                ),
                 Information(
                  labelText: S.of(context).textAge,
                  textHint: '22',
                ),
                Information(
                  labelText: S.of(context).textEmail,
                  textHint: state.user?.email,
                ),
                AppStyles.sizedBoxStyle(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).textSetting,
                    style: AppStyles.textStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ExtraBold',
                    ),
                  ),
                ),
                AppStyles.sizedBoxStyle(height: 15),
                Setting(onTab: _cubit.openLanguagePage),
                AppStyles.sizedBoxStyle(),
                Logout(onTabLogout: _cubit.singOut),
              ],
            ),
          ),
        );
      },
    );

  }
}
