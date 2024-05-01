import 'package:flutter/material.dart';

import 'dimens.dart';

class Spacing extends Object {
  static Widget get vertical => const SizedBox(height: Dimens.margin);
  static Widget get vXSmall => const SizedBox(height: Dimens.marginXSmall);
  static Widget get vSmall => const SizedBox(height: Dimens.marginSmall);
  static Widget get vMedium => const SizedBox(height: Dimens.marginMedium);
  static Widget get vXMedium => const SizedBox(height: Dimens.marginXMedium);
  static Widget get vExtra => const SizedBox(height: Dimens.marginExtra);
  static Widget get vLarge => const SizedBox(height: Dimens.marginLarge);
  static Widget get vXLarge => const SizedBox(height: Dimens.marginXLarge);
  static Widget get vXXLarge => const SizedBox(height: Dimens.marginXXLarge);

  static Widget get horizontal => const SizedBox(width: Dimens.margin);
  static Widget get hXSmall => const SizedBox(width: Dimens.marginXSmall);
  static Widget get hSmall => const SizedBox(width: Dimens.marginSmall);
  static Widget get hMedium => const SizedBox(width: Dimens.marginMedium);
  static Widget get hXMedium => const SizedBox(width: Dimens.marginXMedium);
  static Widget get hLarge => const SizedBox(width: Dimens.marginLarge);
  static Widget get hExtra => const SizedBox(width: Dimens.marginExtra);
  static Widget get hXLarge => const SizedBox(width: Dimens.marginXLarge);
  static Widget get hXXLarge => const SizedBox(width: Dimens.marginXXLarge);
}
