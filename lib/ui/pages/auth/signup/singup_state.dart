
import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/enums/load_status.dart';
class  SingUpState  extends Equatable{
  final LoadStatus  signUpStatus;
  final StatusInput emailStatus;
  final StatusInput passwordStatus;
  final StatusInput nameStatus;
  final StatusInput confirmPasswordStatus;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? name;
  final bool checkProxy;
  final bool isHideOrShowPassword;
  final bool isHideOrShowConfirmPassword;
  const SingUpState({
    this.signUpStatus = LoadStatus.initial,
    this.emailStatus = StatusInput.initial,
    this.passwordStatus = StatusInput.initial,
    this.nameStatus = StatusInput.initial,
    this.confirmPasswordStatus = StatusInput.initial,
    this.email='',
    this.password='',
    this.name='',
    this.confirmPassword='',
    this.checkProxy = false,
    this.isHideOrShowPassword = true,
    this.isHideOrShowConfirmPassword=true,
  });

  @override
  List<Object?> get props => [
    signUpStatus,
    emailStatus,
    passwordStatus,
    nameStatus,
    confirmPasswordStatus,
    email,
    password,
    name,
    confirmPassword,
    checkProxy,
    isHideOrShowPassword,
    isHideOrShowConfirmPassword
  ];

  SingUpState copyWith({
    LoadStatus? signUpStatus,
    StatusInput? emailStatus,
    StatusInput? passwordStatus,
    StatusInput? nameStatus,
    StatusInput? confirmPasswordStatus,
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    bool? checkProxy,
    bool? isHideOrShowPassword,
    bool? isHideOrShowConfirmPassword,
  }) {
    return SingUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      nameStatus: nameStatus ?? this.nameStatus,
      confirmPasswordStatus:
          confirmPasswordStatus ?? this.confirmPasswordStatus,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      checkProxy: checkProxy ?? this.checkProxy,
      isHideOrShowPassword: isHideOrShowPassword ?? this.isHideOrShowPassword,
      isHideOrShowConfirmPassword:
          isHideOrShowConfirmPassword ?? this.isHideOrShowConfirmPassword,
    );
  }
}
