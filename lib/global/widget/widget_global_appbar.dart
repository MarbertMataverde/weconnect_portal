import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

PreferredSizeWidget globalAppBar({
  required BuildContext context,
  Function()? onPressed,
  Widget? leadingIcon,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      splashRadius: 24,
      onPressed: onPressed,
      icon: leadingIcon ??
          Icon(
            Iconsax.arrow_square_left,
            color: Theme.of(context).iconTheme.color,
          ),
    ),
  );
}
