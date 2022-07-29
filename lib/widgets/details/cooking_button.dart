import 'package:flutter/material.dart';

enum VariantButton { startCooking, stopCooking, checkIngredients }

//TODO: All commented code for the next version ;)
// enum ColorButton { primary, secondary, success, error }

enum SizeButton { small, medium, large }

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.variant = VariantButton.startCooking,
    this.text,
    // this.color = ColorButton.primary,
    this.size = SizeButton.medium,
    this.onPressed,
    //this.disable = false
  }) : super(key: key);

  final VariantButton variant;
  // final ColorButton color;
  final SizeButton size;
  final String? text;
  final VoidCallback? onPressed;
  //final bool disable;

  @override
  Widget build(BuildContext context) {
    return _size(TextButton(
      style: _buttonStyle(),
      onPressed: onPressed,
      child: Text(
        _text(),
        style: _textStyle(),
      ),
    ));
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: _textColor(),
    );
  }

  Widget _size(Widget child) {
    return SizedBox(height: 48, width: 232, child: child);
  }

  MaterialStateProperty<Color>? _backgroundColor() {
    switch (variant) {
      case VariantButton.startCooking:
        return MaterialStateProperty.all<Color>(const Color(0xFF165932));
      case VariantButton.stopCooking:
        return MaterialStateProperty.all<Color>(Colors.white);
      case VariantButton.checkIngredients:
        return MaterialStateProperty.all<Color>(Colors.white);
      default:
        return MaterialStateProperty.all<Color>(const Color(0xFF165932));
    }
  }

  Color _textColor() {
    switch (variant) {
      case VariantButton.startCooking:
        return Colors.white;
      case VariantButton.stopCooking:
        return const Color(0xFF165932);
      case VariantButton.checkIngredients:
        return const Color(0xFF165932);
      default:
        return Colors.white;
    }
  }

  String _text() {
    return text ??
        () {
          switch (variant) {
            case VariantButton.startCooking:
              return 'Начать готовить';
            case VariantButton.stopCooking:
              return 'Закончить готовить';
            case VariantButton.checkIngredients:
              return 'Проверить наличие';
            default:
              return 'Начать готовить';
          }
        }();
  }

  MaterialStateProperty<OutlinedBorder?>? _shape() {
    return MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: _side(),
    ));
  }

  BorderSide _side() {
    switch (variant) {
      case VariantButton.startCooking:
        return BorderSide.none;
      case VariantButton.stopCooking:
        return const BorderSide(
          width: 4,
          color: Color(0xFF165932),
        );
      case VariantButton.checkIngredients:
        return const BorderSide(
          width: 4,
          color: Color(0xFF165932),
        );
      default:
        return BorderSide.none;
    }
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      shape: _shape(),
      backgroundColor: _backgroundColor(),
    );
  }
}
