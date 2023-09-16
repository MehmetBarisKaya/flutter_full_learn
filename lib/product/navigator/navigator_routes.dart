import '../../303/lottie/lottie_learn.dart';
import '../../303/navigator/navigate_home_detail.dart';
import '../../303/navigator/navigate_home_view.dart';
import '../../303/navigator/navigate_profile_view.dart';

class NavigatorRoutes {
  static const paraf = "/";
  final items = {
    paraf: (context) => const LottieLearn(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => NavigateHomeDetail(),
    "/profile": (context) => const NavigateProfieView(),
  };
}

enum NavigateRoutes { init, home, detail }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
