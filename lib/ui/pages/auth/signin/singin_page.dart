import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newware_final_project/bloc/app_cubit.dart';
import 'package:newware_final_project/common/app_colors.dart';
import 'package:newware_final_project/common/app_dimensions.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/common/app_styles.dart';
import 'package:newware_final_project/common/app_texts.dart';
import 'package:newware_final_project/hooks/validate_input.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
import 'package:newware_final_project/repositories/auth_responsitory.dart';
import 'package:newware_final_project/repositories/user_responsitory.dart';
import 'package:newware_final_project/ui/pages/auth/common/fashion.dart';
import 'package:newware_final_project/ui/pages/auth/common/sub_header_auth.dart';
import 'package:newware_final_project/ui/pages/auth/signin/singin_cubit.dart';
import 'package:newware_final_project/ui/pages/auth/signin/singin_state.dart';
import 'package:newware_final_project/ui/widget/button/app_button.dart';
import 'package:newware_final_project/ui/widget/loading/loading_status.dart';
import 'package:newware_final_project/ui/widget/textfield/app_email_text_field.dart';
import 'package:newware_final_project/ui/widget/textfield/app_password_text_field.dart';
import '../../../../firebase_options.dart';
import 'singin_navigator.dart';
import 'widgets/custom_devide.dart';

class SingInPage extends StatefulWidget {
  static const router = 'singIn';

  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (con) {
        final authRepo = RepositoryProvider.of<AuthResponsitory>(context);
        final userRepo = RepositoryProvider.of<UserResponsitory>(context);
        final appCubit = RepositoryProvider.of<AppCubit>(context);
        return SignInCubit(
          navigator: SignInNavigator(context: context),
          authRepo: authRepo,
          userRepo: userRepo,
          appCubit: appCubit,
        );
      },
      child: const SingInChildPage(),
    );
  }
}

class SingInChildPage extends StatefulWidget {
  const SingInChildPage({super.key});

  @override
  State<SingInChildPage> createState() => _SingInChildPageState();
}

class _SingInChildPageState extends State<SingInChildPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailTextController;
  late final TextEditingController passwordTextController;
  late SignInCubit _cubit;
  Widget? emailIcon;
  Widget? passwordIcon;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    _cubit = BlocProvider.of<SignInCubit>(context);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocBuilder<SignInCubit, SignInState>(
          bloc: _cubit,
          builder: (context, state) {
            Map<String, Widget> icons =
            ValidateInput().checkValidateLogin(state: state);
            emailIcon = icons['emailIcon'];
            passwordIcon = icons['passwordIcon'];
            return state.signInStatus == LoadStatus.loading
                ? const LoadingStatus()
                : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                children: [
                  const Fashion(),
                  const SubHeaderAuth(
                    title: AppTexts.textWelcome,
                    description: AppTexts.textLoginNote,
                  ),
                  const SizedBox(
                    height: AppDimensions.d_60,
                  ),
                  Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppEmailTextField(
                              icon: emailIcon,
                              onChanged: (text) {
                                _cubit.changeEmail(
                                  email: text,
                                );
                              },
                              textEditingController: emailTextController,
                            ),
                            AppStyles.sizedBoxStyle(
                              height: 20,
                            ),
                            AppPasswordField(
                              icon: passwordIcon,
                              onChanged: (text) {
                                _cubit.changePassword(
                                  password: text,
                                );
                              },
                              textEditingController:
                              passwordTextController,
                            ),
                          ],
                        ),
                      ),
                      AppStyles.sizedBoxStyle(),
                      state.signInStatus == LoadStatus.failure
                          ? Text(
                        AppTexts.textInvalid,
                        style: AppStyles.textStyle(
                          color: AppColors.redColor,
                        ),
                      )
                          : const SizedBox.shrink(),
                      AppStyles.sizedBoxStyle(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _cubit.signIn();
                          }
                        },
                        child: const AppButton(
                          textButton: AppTexts.textLogin,
                          textColor: AppColors.primaryColor,
                          backGroundColor: AppColors.secondaryColor,
                          icon: null,
                          isHasBorder: false,
                        ),
                      ),
                    ],
                  ),
                  AppStyles.sizedBoxStyle(),
                  const DeviderLine(),
                  AppStyles.sizedBoxStyle(),
                  InkWell(
                    child: AppButton(
                      textButton: AppTexts.textLoginWithFacebook,
                      textColor: AppColors.primaryColor,
                      backGroundColor: AppColors.blueColor,
                      icon: AppStyles.iconSvgStyle(
                        pathImage: AppImages.pathFacebookImage,
                      ),
                      isHasBorder: false,
                    ),
                  ),
                  AppStyles.sizedBoxStyle(),
                  InkWell(
                    onTap: ()  {
                    singInWithGoogle();
                    },
                    child: AppButton(
                      textButton: AppTexts.textLoginWithGoogle,
                      textColor: AppColors.greyColor_1,
                      backGroundColor: Colors.transparent,
                      icon: AppStyles.iconSvgStyle(
                        pathImage: AppImages.pathGoogleImage,
                      ),
                      isHasBorder: true,
                    ),
                  ),
                  AppStyles.sizedBoxStyle(),
                  InkWell(
                    child: AppButton(
                      textButton: AppTexts.textLoginWithApple,
                      textColor: AppColors.greyColor_1,
                      backGroundColor: Colors.transparent,
                      icon: AppStyles.iconSvgStyle(
                        pathImage: AppImages.pathAppleImage,
                      ),
                      isHasBorder: true,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  singInWithGoogle()async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth =await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
  }
}