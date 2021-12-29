import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app/app_constants.dart';

// ignore: must_be_immutable
class OutLinedStandartButton extends StatelessWidget {
  String text;
  final VoidCallback? onPressed;
  final height;
  final width;
  final Color? color;

  OutLinedStandartButton(this.text,
      {this.onPressed, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Ink(
        height: height ?? 50,
        width: width ?? context.width,
        decoration: BoxDecoration(
            border: Border.all(color: context.theme.colorScheme.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: _buildAutoSizeText(context),
        ),
      ),
    );
  }

  Widget _buildAutoSizeText(BuildContext context) {
    return AutoSizeText(text,
        style: context.textTheme.headline6!.copyWith(
            fontFamily: ApplicationConstants.FONT_FAMILY_MEDIUM, fontSize: 16));
  }
}
