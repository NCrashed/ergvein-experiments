import 'package:flutter/widgets.dart';
import 'data.dart';

/// Custom icons for Ergvein wallet
class ErgveinIcons {
  /// Blockstream icon
  static const IconData blockstream = const IconDataErgvein(0xe800);

  /// Unconfirmed transaction icon
  static const IconData unconfirmed = const IconDataErgvein(0xe805);

  /// One confirmation icon
  static const IconData confirm_one = const IconDataErgvein(0xe802);

  /// Two confirmations icon
  static const IconData confirm_two = const IconDataErgvein(0xe803);

  /// three confirmations icon
  static const IconData confirm_three = const IconDataErgvein(0xe804);
}
