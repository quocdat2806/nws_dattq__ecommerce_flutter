import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/common/app_images_icons.dart';
import 'package:newware_final_project/generated/l10n.dart';
import 'package:newware_final_project/ui/pages/onboarding/onboarding_cubit.dart';
import 'package:newware_final_project/ui/pages/onboarding/onboarding_navigator.dart';
import 'package:newware_final_project/ui/pages/onboarding/widgets/next_button.dart';
import 'package:newware_final_project/ui/pages/onboarding/widgets/onboarding_sub_page.dart';

import 'widgets/dot_indicator.dart';

class OnboardingPage extends StatefulWidget {
  static const router = 'onBoarding';

  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return OnboardingCubit(
          navigator: OnboardingNavigator(
            context: context,
          ),
        );
      },
      child: const OnboardingChildPage(),
    );
  }
}

class OnboardingChildPage extends StatefulWidget {
  const OnboardingChildPage({super.key});

  @override
  State<OnboardingChildPage> createState() => _OnboardingChildPageState();
}

class _OnboardingChildPageState extends State<OnboardingChildPage> {
  List<Widget> _onboardingPages = [];
  late OnboardingCubit _cubit;
  final PageController _pageViewController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<OnboardingCubit>(context);
    _cubit.setTotalPage(
      totalPage: 3,
    );
    if (mounted) {
      _onboardingPages = [
        OnboardingSubPage(
          title: S.current.titleOnbroadingPage_1,
          image: AppImages.pathOnbroadingPageImage_1,
        ),
        OnboardingSubPage(
          title: S.current.titleOnbroadingPage_2,
          image: AppImages.pathOnbroadingPageImage_2,
        ),
        OnboardingSubPage(
          title: S.current.titleOnbroadingPage_3,
          image: AppImages.pathOnbroadingPageImage_3,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 26),
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        _cubit.onPageChanged(value);
                      },
                      itemCount: _onboardingPages.length,
                      controller: _pageViewController,
                      itemBuilder: (context, index) =>
                          _onboardingPages[state.activePage],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                      _onboardingPages.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(
                          right: 4,
                        ),
                        child: DotIndicator(index == state.activePage),
                      ),
                    ),
                    const Spacer(),
                    NextButton(
                      state: state,
                      cubit: _cubit,
                      pageController: _pageViewController,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
