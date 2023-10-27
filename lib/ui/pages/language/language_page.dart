import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/bloc/setting/app_setting_cubit.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/language/language_cubit.dart';
import 'package:newware_final_project/ui/pages/language/widgets/language_item.dart';
import 'package:newware_final_project/ui/pages/language/widgets/save_language.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        return LanguageCubit(
          settingCubit: RepositoryProvider.of<AppSettingCubit>(context),
          appCubit: RepositoryProvider.of<AppCubit>(context),
        );
      },
      child: const LanguagePageState(),
    );
  }
}

class LanguagePageState extends StatefulWidget {
  const LanguagePageState({super.key});

  @override
  State<LanguagePageState> createState() => _LanguagePageStateState();
}

class _LanguagePageStateState extends State<LanguagePageState> {
  late LanguageCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<LanguageCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: iconBack(
          onTabBackIcon: (){
            GoRouter.of(context).pop();
          }
        ),
        title:  Text(S.of(context).textChangeLanguage),
      ),
      body: SafeArea(
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (context, state) {
            return Column(
              children: [
                LanguageItem(
                  state: state,
                  languageText: 'English',
                  onTabLanguage: _cubit.changeEnLanguage,
                  symboliclanguage: 'en',
                ),
                const Divider(),
                LanguageItem(
                  state: state,
                  languageText: 'VietNam',
                  onTabLanguage: _cubit.changeViLanguage,
                  symboliclanguage: 'vi',
                ),
                const Divider(),
                SaveLanguage(
                  state: state,
                  cubit: _cubit,
                )
              ],
            );
          },
        ),
      ),
    );
  }
  Widget iconBack({Function()?onTabBackIcon}){
    return InkWell(
      onTap: onTabBackIcon,
      child: const Icon(
        Icons.navigate_before_outlined,
      ),
    );
  }
}
