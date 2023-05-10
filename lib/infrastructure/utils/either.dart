abstract class Either<L, R> {
  final L? _left;
  final R? _right;
  final bool _isLeft;

  Either(this._left, this._right, this._isLeft);

  bool get isLeft => _isLeft;
  bool get isRight => !_isLeft;

  R? get right => _isLeft ? null : _right;
  L? get left => _isLeft ? _left : null;

  // ignore: always_declare_return_types
  T fold<T>(T Function(L? value) l, T Function(R? value) r) {
    return _isLeft ? l(_left) : r(_right);
  }
}

class Left<L, R> extends Either<L, R> {
  Left(L value) : super(value, null, true);

  @override
  String toString() {
    return "Instance of 'Left<$_left, $R>'";
  }
}

class Right<L, R> extends Either<L, R> {
  Right(R value) : super(null, value, false);

  @override
  String toString() {
    return "Instance of 'Right<$L, $_right>'";
  }
}
