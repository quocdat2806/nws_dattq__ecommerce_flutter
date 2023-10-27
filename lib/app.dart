import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';
import 'package:newware_final_project/repositories/category_responsitory.dart';
import 'package:newware_final_project/repositories/product_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'bloc/setting/app_setting_cubit.dart';
import 'generated/l10n.dart';
import 'router/router_config.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthResponsitory>(create: (context) {
          return AuthResponsitoryImpl();
        }),
        RepositoryProvider<UserResponsitory>(create: (context) {
          return UserResponsitoryImpl();
        }),
        RepositoryProvider<CategoryResponsitory>(create: (context) {
          return CategoryResponsitoryImpl();
        }),
        RepositoryProvider<ProductResponsitory>(create: (context) {
          return ProductResponsitoryImpl();
        }),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (context) {
              final userRepo = RepositoryProvider.of<UserResponsitory>(context);
              final authRepo = RepositoryProvider.of<AuthResponsitory>(context);
              return AppCubit(
                userRepo: userRepo,
                authRepo: authRepo,
              );
            },
          ),
          BlocProvider<AppSettingCubit>(create: (context) {
            return AppSettingCubit();
          }),
        ],
        child: const MyAppChildPageState(),
      ),
    );
  }
}

class MyAppChildPageState extends StatefulWidget {
  const MyAppChildPageState({super.key});

  @override
  State<MyAppChildPageState> createState() => _MyAppChildPageStateState();
}

class _MyAppChildPageStateState extends State<MyAppChildPageState> {
  late AppSettingCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<AppSettingCubit>(context);
    _cubit.setDefaultLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      buildWhen: (previous, current) =>
          previous.isSaveLanguage != current.isSaveLanguage,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            _hideKeyboard(context);
          },
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'Medium',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('vi'),
            ],
            locale: Locale(state.language),
          ),
        );
      },
    );
  }
}

void _hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
