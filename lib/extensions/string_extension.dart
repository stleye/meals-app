extension StringCapitalization on String {
  String get capitalize {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }
}
