import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_dimensions.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/common/app_texts.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/hooks/validate_input.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/responsitories/auth_responsitory.dart';
import 'package:newware_final_project/responsitories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/auth/common/fashion.dart';
import 'package:newware_final_project/ui/pages/auth/common/sub_header_auth.dart';
import 'package:newware_final_project/ui/pages/auth/signup/signup_cubit.dart';
import 'package:newware_final_project/ui/pages/auth/signup/signup_navigator.dart';
import 'package:newware_final_project/ui/pages/auth/signup/signup_state.dart';
import 'package:newware_final_project/ui/pages/auth/signup/widgets/checkbox_proxy.dart';
import 'package:newware_final_project/ui/widget/button/app_button.dart';
import 'package:newware_final_project/ui/widget/loading/circular_loading.dart';
import 'package:newware_final_project/ui/widget/textfield/app_confirm_password_text_field.dart';
import 'package:newware_final_project/ui/widget/textfield/app_email_text_field.dart';
import 'package:newware_final_project/ui/widget/textfield/app_password_text_field.dart';
import 'package:newware_final_project/ui/widget/textfield/app_name_text_field.dart';

class SingUpPage extends StatefulWidget {
  static const router = 'signUp';

  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final authRepo = RepositoryProvider.of<AuthResponsitory>(context);
        final userRepo = RepositoryProvider.of<UserResponsitory>(context);
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return SingUpCubit(
          navigator: SignUpNavigator(context: context),
          authRepo: authRepo,
          userRepo: userRepo,
          appCubit: appCubit,
        );
      },
      child: const SingUpChildPage(),
    );
  }
}

class SingUpChildPage extends StatefulWidget {
  const SingUpChildPage({super.key});

  @override
  State<SingUpChildPage> createState() => _SingUpChildPageState();
}

class _SingUpChildPageState extends State<SingUpChildPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;
  late final TextEditingController nameTextController;
  late final TextEditingController confirmPasswordTextController;
  Widget? emailIcon;
  Widget? passwordIcon;
  Widget? nameIcon;
  Widget? confirmPasswordIcon;
  late SingUpCubit _cubit;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    confirmPasswordTextController = TextEditingController();
    nameTextController = TextEditingController();
    _cubit = BlocProvider.of<SingUpCubit>(context);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    nameTextController.dispose();
    confirmPasswordTextController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SingUpCubit, SingUpState>(
        bloc: _cubit,
        builder: (context, state) {
          final Map<String, Widget> icons = UseValidateInput().checkValidateSingUp(
            state: state,
          );
          emailIcon = icons['emailIcon'];
          passwordIcon = icons['passwordIcon'];
          nameIcon = icons['nameIcon'];
          confirmPasswordIcon = icons['confirmPasswordIcon'];
          return state.signUpStatus == LoadStatus.loading
              ? const CircularLoading()
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        const SafeArea(
                          bottom: false,
                          child: Fashion(),
                        ),
                        SubHeaderAuth(
                          title: S.current.textSingUp,
                          description: S.current.textCreateAccount,
                        ),
                        AppStyles.sizedBoxStyle(
                          height: AppDimensions.d_40,
                        ),
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  AppNameTextField(
                                    labelText: S.current.textName,
                                    hintText: S.current.textNameLable,
                                    iconValidate: nameIcon,
                                    onChangedText: (text) {
                                      _cubit.changeName(
                                        name: text,
                                      );
                                    },
                                    textEditingController: nameTextController,
                                  ),
                                  AppStyles.sizedBoxStyle(),
                                  AppEmailTextField(
                                    labelText: S.current.textEmail,
                                    hintText: S.current.textEmailLable,
                                    iconValidate: emailIcon,
                                    onChangedText: (text) {
                                      _cubit.changeEmail(
                                        email: text,
                                      );
                                    },
                                    textEditingController: emailTextController,
                                  ),
                                  AppStyles.sizedBoxStyle(),
                                  AppPasswordField(
                                    labelText: S.current.textPassword,
                                    hintText: S.current.textPasswordLable,
                                    isHidePassword: state.isHidePassword,
                                    handleShowOrHidePassword:
                                        _cubit.handleShowOrHidePassword,
                                    iconShowOrHidePassword: state.isHidePassword
                                        ? const Icon(
                                            Icons.remove_red_eye,
                                          )
                                        : const Icon(
                                            Icons.visibility_off_outlined,
                                          ),
                                    iconValidate: passwordIcon,
                                    onChangedText: (text) {
                                      _cubit.changePassword(
                                        password: text,
                                      );
                                    },
                                    textEditingController:
                                        passwordTextController,
                                  ),
                                  AppStyles.sizedBoxStyle(),
                                  AppConfirmPasswordField(
                                    labelText: S.current.textConfirmPassword,
                                    hintText:
                                        S.current.textConfirmPasswordLable,
                                    isHidePassword:
                                        state.isHideConfirmPassword,
                                    handleShowOrHideConfirmPassword:
                                        _cubit.handleShowOrHideConfirmPassword,
                                    iconShowOrHideConfirmPassword:
                                        state.isHideConfirmPassword
                                            ? const Icon(
                                                Icons.remove_red_eye,
                                              )
                                            : const Icon(
                                                Icons.visibility_off_outlined,
                                              ),
                                    iconValidate: confirmPasswordIcon,
                                    passwordEdittingController:
                                        passwordTextController,
                                    onChangedText: (text) {
                                      _cubit.changeConfirmPassword(
                                        confirmPassword: text,
                                      );
                                    },
                                    textEditingController:
                                        confirmPasswordTextController,
                                  ),
                                ],
                              ),
                            ),
                            AppStyles.sizedBoxStyle(),
                            CheckBoxProxy(
                              isCheckedCheckbox: state.isCheckProxy,
                              handleTabCheckbox: _cubit.handleTabCheckbox,
                            ),
                            AppStyles.sizedBoxStyle(
                              height: 15,
                            ),
                            AppButton(
                              handleTabButton: () {
                                _cubit.handleSingUp(
                                  _formKey.currentState!.validate(),
                                );
                              },
                              textButton: AppTexts.textSingUp,
                              textColor: AppColors.primaryColor,
                              backGroundColor: state.isCheckProxy
                                  ? AppColors.secondaryColor
                                  : AppColors.greyColor,
                              icon: null,
                              isHasBorder: false,
                            ),
                            const SafeArea(
                              top: false,
                              child: SizedBox(height: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
