import 'package:flutter/material.dart';
import 'package:rush_alert/helpers/colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    required this.onPress,
    this.buttonText,
    this.buttonColor,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight,
    this.shadow = false,
    this.isOutlined = false,
    this.outlineColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    this.centerText = true,
    this.icon,
    this.iconColor,
    this.iconHeight = 20,
    this.iconWidth = 20

  });

  final buttonText;
  final buttonColor;
  final textColor;
  final double fontSize;
  final fontWeight;
  final shadow;
  final isOutlined;
  final outlineColor;
  final VoidCallback? onPress;
  final padding;
  final centerText;
  final icon;
  final iconColor;
  final iconHeight;
  final iconWidth;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          enableFeedback: false,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          onSurface: Colors.transparent,
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
        ),

        child: Container(
          alignment: centerText ? Alignment.center : Alignment.centerLeft,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: buttonColor,
             border: isOutlined ? Border.all(color: outlineColor, width: 1) : null,
             boxShadow: [
               if(shadow) BoxShadow(
                color: ColorUtils.DarkGrey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],

          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: centerText ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              if(icon != null) Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(icon, height: iconHeight.toDouble(), width: iconWidth.toDouble(), color: iconColor ?? ColorUtils.Grey,),
              ),
              Text(
                buttonText,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize
                ),
              ),
            ],
          ),
        ));
  }
}
