import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class SignInState extends Equatable {
  final LoadStatus signInStatus;
  final StatusInput emailStatus;
  final StatusInput passwordStatus;
  final bool isHidePassword;
  final String? email;
  final String? password;


  const SignInState({
    this.signInStatus = LoadStatus.initial,
    this.emailStatus = StatusInput.initial,
    this.passwordStatus = StatusInput.initial,
    this.email,
    this.password,
    this.isHidePassword = true,

  });
  @override
  List<Object?> get props => [
    signInStatus,
    email,
    password,
    passwordStatus,
    emailStatus,
    isHidePassword

  ];

  SignInState copyWith({
    LoadStatus? signInStatus,
    StatusInput? emailStatus,
    StatusInput? passwordStatus,
    bool? isHidePassword,
    String? email,
    String? password,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      isHidePassword: isHidePassword ?? this.isHidePassword,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

