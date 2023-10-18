import 'package:equatable/equatable.dart';
import 'package:newware_final_project/models/enums/load_status.dart';

class SignInState extends Equatable {
  final LoadStatus signInStatus;
  final StatusInput emailStatus;
  final StatusInput passwordStatus;
  final String? email;
  final String? password;


  const SignInState({
    this.signInStatus = LoadStatus.initial,
    this.emailStatus = StatusInput.initial,
    this.passwordStatus = StatusInput.initial,
    this.email,
    this.password,

  });
  @override
  List<Object?> get props => [
    signInStatus,
    email,
    password,
    passwordStatus,
    emailStatus

  ];

  SignInState copyWith({
    LoadStatus? signInStatus,
    String? email,
    String? password,
    StatusInput? emailStatus,
    StatusInput? passwordStatus,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

