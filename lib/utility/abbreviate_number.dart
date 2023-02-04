String abbreviateNumber(double number) {
  if (number >= 1000000000) {
    String abbreviation = "${(number / 1000000000).toStringAsFixed(2)}b";
    return abbreviation;
  } else if (number >= 1000000) {
    String abbreviation = "${(number / 1000000).toStringAsFixed(2)}m";
    return abbreviation;
  } else if (number >= 1000) {
    String abbreviation = "${(number / 1000).toStringAsFixed(2)}k";
    return abbreviation;
  }
  return number.toStringAsFixed(2).toString();
}