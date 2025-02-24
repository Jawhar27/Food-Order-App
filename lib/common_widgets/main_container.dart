import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final bool isLoading;
  final bool enableScrolling;
  final Widget child;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final bool isSafeAreaNeeded;
  final double customMargin;
  final bool resizeToAvoidBottomInset;

  const MainContainer({
    super.key,
    this.isLoading = false,
    required this.child,
    this.enableScrolling = false,
    this.appBar,
    this.bottomNavigationBar,
    this.isSafeAreaNeeded = false,
    this.customMargin = 20.0,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      margin: EdgeInsets.all(
        customMargin,
      ),
      child: child,
    );

    if (enableScrolling) {
      content = SingleChildScrollView(
        child: content,
      );
    }

    if (isSafeAreaNeeded) {
      content = SafeArea(
        child: content,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: Stack(
        children: [
          content,
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
