import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/database/shared_preferences_helper.dart';
import 'package:newware_final_project/ui/pages/onboarding/onboarding_navigator.dart';
part 'onboarding_state.dart';
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingNavigator navigator;

  OnboardingCubit({
    required this.navigator,
  }) : super(const OnboardingState());

  void onPageChanged(int currentIndex) {
    emit(
      state.copyWith(
        activePage: currentIndex,
      ),
    );

  }

  void setTotalPage({required int totalPage}) {
    emit(
      state.copyWith(
        totalPage: totalPage,
      ),
    );
  }

  void handleNextPage({
    required int nextPage,
    required BuildContext context,
  }) {
    if (nextPage < state.totalPage) {
      emit(
        state.copyWith(
          activePage: nextPage,
        ),
      );
    } else {
      SharedPreferencesHelper.setOnboard();
      navigator.openAuthPage();
    }
  }
}
