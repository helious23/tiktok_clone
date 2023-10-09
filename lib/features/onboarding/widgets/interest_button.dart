import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.onSelectionChanged,
  });

  final String interest;
  final ValueChanged<bool> onSelectionChanged;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onSelectionChanged(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(
              Sizes.size32,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 5,
              )
            ]),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
          child: Text(
            widget.interest,
          ),
        ),
      ),
    );
  }
}
