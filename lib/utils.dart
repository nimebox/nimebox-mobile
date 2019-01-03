import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void launchUrl(BuildContext context, String url) async {
  try {
    await launch(
      url,
      option: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsAnimation(
          startEnter: 'android:anim/fade_in',
          startExit: 'android:anim/fade_out',
          endEnter: 'android:anim/fade_in',
          endExit: 'android:anim/fade_out',
        ),
      ),
    );
  } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
  }
}

/// Work around flutter#20495
class NotSuddenJumpPhysics extends ClampingScrollPhysics {
  @override
  double get dragStartDistanceMotionThreshold => 3.5;
}

class NotSuddenJumpScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return const BouncingScrollPhysics();
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return NotSuddenJumpPhysics();
    }
    return null;
  }
}
