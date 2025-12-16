import 'package:flutter/material.dart';

class BottomsheetLayout extends StatelessWidget {
  final String? title;
  final Widget? button;
  final Widget child;

  const BottomsheetLayout(
      {super.key, required this.title, required this.child, this.button});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    title!,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 24),
                  ),
                  const Spacer(),
                  if (button != null) button!,
                ],
              ),
            ),
          child,
        ],
      ),
    );
  }
}