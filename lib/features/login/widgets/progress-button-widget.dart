import 'package:flextras/flextras.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../../utils/extensions.dart';
import '../../../utils/hooks.dart';

class ProgressButtonWidget extends HookWidget {
  const ProgressButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final AsyncCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final (:pending, :snapshot, hasError: _) = useAsyncTask();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      onPressed: onPressed == null ? null : () => pending.value = onPressed!(),
      child: SeparatedRow(
        separatorBuilder: () => const Gap(12),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (snapshot.connectionState == ConnectionState.waiting)
            SizedBox.square(
              dimension: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colorScheme.onPrimary,
              ),
            ),
          Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
