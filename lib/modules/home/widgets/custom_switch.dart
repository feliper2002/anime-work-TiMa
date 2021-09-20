import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool? mode;

  const CustomSwitch({Key? key, this.mode}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    final double size = 35;

    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 190),
          height: size,
          width: size * 2.7,
          alignment:
              widget.mode! ? Alignment.centerRight : Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.mode!
                  ? AppColors.daySwitchBg
                  : AppColors.nightSwitchBg,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            margin: const EdgeInsets.all(4),
            height: size,
            width: size,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: !widget.mode!
                    ? AppColors.daySwitchSnap
                    : AppColors.nightSwitchSnap,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!,
                  offset: Offset(1.8, 1.8),
                  blurRadius: .6,
                ),
              ],
            ),
          ),
        ),
        widget.mode!
            ? Positioned(
                left: size / 3,
                child: Container(
                  height: size,
                  width: size * 1.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset('assets/images/clouds.png').image),
                  ),
                ),
              )
            : Positioned(
                right: size / 3.3,
                child: Container(
                  height: size,
                  width: size * 1.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset('assets/images/starts.png').image),
                  ),
                ),
              ),
      ],
    );
  }
}
