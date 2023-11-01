part of 'main_cubit.dart';

class  MainState extends Equatable {
  final int selectedIndex;
  final int quantityNotify;
  const MainState({
    this.selectedIndex = 0,
    this.quantityNotify = 0 ,
  });

  MainState copyWith({
    int? selectedIndex,
    int? quantityNotify,
  }) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      quantityNotify: quantityNotify ?? this.quantityNotify,
    );
  }

  @override
  List<Object?> get props => [
    selectedIndex,
    quantityNotify,
  ];
}
