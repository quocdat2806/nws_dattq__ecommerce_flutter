import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/setting/app_setting_cubit.dart';
import 'package:newware_final_project/ui/pages/language/language_cubit.dart';

import '../../../bloc/app_cubit.dart';

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
        leading: const Icon(Icons.navigate_before_outlined),
        title: const Text('Đổi ngôn ngũ'),
      ),
      body: SafeArea(
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          builder: (context, state) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    _cubit.changeEnLanguage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Text('Tiêng Anh'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Tiêng Anh'),
                        (state.language == 'en')
                            ? const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.check))
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: (){
                    _cubit.changeViLanguage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child:  Row(
                      children: [
                        const Text('Tiêng Viet'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Tiêng Viet'),
                        (state.language == 'vi')
                            ? const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.check))
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: state.isChange? Colors.blue:Colors.grey,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 30,
                  ),
                  child: InkWell(
                    onTap: () {
                      _cubit.saveSetting(
                        language: state.language,
                      );
                    },
                    child: const Text(
                      'Lưu',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
