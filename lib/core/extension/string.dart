
extension StringExtension on String {
  int? get tryInt => int.tryParse(this);
  double? get tryDouble => double.tryParse(this);
}
