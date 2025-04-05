// ignore_for_file: unused_field, unused_local_variable

/* These implementation definitions enable zero-argument contructors:
 *    throw EmptyBufferException();
 */

class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  CircularBuffer(int n) {
    _buffer = List.filled(n, 0);
    _len = n;
  }

  late final List<int> _buffer;
  late final _len;
  int r = 0;
  int w = 0;

  int read() {
    // throw if buffer empty
    if (_buffer[r] == 0) throw new EmptyBufferException();
    // get value
    final result = _buffer[r];
    // erase
    _buffer[r] = 0;
    // increase pointer, wrap if over length
    r = (r + 1) % _len as int;
    return result;
  }

  write(int n, {bool force = false}) {
    // if full and wrapped
    if (_buffer[w] != 0) {
      // throw if full and not force
      if (!force) throw new FullBufferException();
      // else move read pointer because the oldest value is override
      r = (r + 1) % _len as int;
    }
    // write
    _buffer[w] = n;
    // increase pointer, wrap if over length
    w = (w + 1) % _len as int;
  }

  clear() {
    // loop through each item and erase
    for (var i = 0; i < _len; i++) {
      _buffer[i] = 0;
    }
  }
}
