part of 'main_cubit.dart';

class  MainState extends Equatable {
  final int selectedIndex;
  final int couterNotify;
  const MainState({
    this.selectedIndex = 0,
    this.couterNotify = 0 ,
  });

  MainState copyWith({
    int? selectedIndex,
    int? couterNotify,
  }) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      couterNotify: couterNotify ?? this.couterNotify,
    );
  }

  @override
  List<Object?> get props => [
    selectedIndex,
    couterNotify,
  ];
}
