extension stringExtension on String {
  String capitalize() {
    if(this == null || this == "")
      return "";
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}