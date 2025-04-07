import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const SmallButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.buttonSize,
      height: AppConstants.buttonSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
        ),
        child: Icon(icon, size: AppConstants.iconSize),
      ),
    );
  }
}

