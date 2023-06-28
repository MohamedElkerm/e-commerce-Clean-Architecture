import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/fonts_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontConstants.fontFamiy,
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.medium,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.light,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.bold,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
  FontWeight fontWeight = FontWeightManager.semiBold,
}) {
  return _getTextStyle(
    fontSize,
    fontWeight,
    color,
  );
}
