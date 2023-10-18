part of 'splash_cubit.dart';

class SplashState extends Equatable {
  final LoadStatus fetchProfileStatus;

  const SplashState({
    this.fetchProfileStatus = LoadStatus.initial,
  });

  SplashState copyWith({LoadStatus? fetchProfileStatus}) {
    return SplashState(
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
    );
  }

  @override
  List<Object?> get props => [fetchProfileStatus];
}
