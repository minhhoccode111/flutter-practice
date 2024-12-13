class Queen {
  late final row;
  late final col;

  Queen(this.row, this.col) {
    if (row < 0) throw new AssertionError('row not positive');
    if (row > 7) throw new AssertionError('row not on board');
    if (col < 0) throw new AssertionError('column not positive');
    if (col > 7) throw new AssertionError('column not on board');
  }

  bool canAttack(Queen other) {
    if (this.row == other.row) return true;
    if (this.col == other.col) return true;
    if (this.row - this.col == other.row - other.col) return true;
    if (this.row + this.col == other.row + other.col) return true;

    return false;
  }
}
