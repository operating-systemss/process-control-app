import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app/app_constants.dart';

// ignore: must_be_immutable
class FilledStandartButton extends StatelessWidget {
  String text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isLoading;
  final Color? color;

  FilledStandartButton(this.text,
      {Key? key, this.onPressed, this.height, this.width, this.color, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: Ink(
          height: height ?? 50,
          width: width ?? context.width,
          decoration:
              BoxDecoration(color: color ?? context.theme.colorScheme.primary, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: isLoading ? const CircularProgressIndicator() : _buildAutoSizeText(context),
          ),
        ),
      ),
    );
  }

  Widget _buildAutoSizeText(BuildContext context) {
    return AutoSizeText(text,
        style:
            context.textTheme.headline6!.copyWith(fontFamily: ApplicationConstants.FONT_FAMILY_MEDIUM, fontSize: 16));
  }
}
