class DynamicArray<T> extends Iterable<T> {
  DynamicArray([int capacity = 16]) {
    if (capacity < 0) throw Exception('Illegal Capacity: $capacity');
    _capacity = capacity;
    _arr = List.filled(capacity, null);
  }

  List<T?> _arr = <T>[];
  int _len = 0;
  int _capacity = 0;

  @override
  Iterator<T> get iterator {
    return DynamicArrayIterator<T>(_arr, _len);
  }

  int size() {
    return _len;
  }

  void clear() {
    for (int x = 0; x < _capacity; x++) {
      _arr[x] = null;
    }
    _len = 0;
  }

  T get(int index) {
    if (index > _len - 1 || index < 0) {
      throw Exception('Array index out of bounds');
    }

    return _arr[index]!;
  }

  void set(int index, T elem) {
    if (index > _len - 1 || index < 0) {
      throw Exception('Array index out of bounds');
    }

    _arr[index] = elem;
  }

  void add(T elem) {
    if (_len + 1 >= _capacity) {
      if (_capacity == 0) {
        _capacity = 1;
      } else {
        _capacity = _capacity * 2;
      }

      List<T?> newArr = List.filled(_capacity, null);
      for (int x = 0; x < _len; x++) {
        newArr[x] = _arr[x];
      }
      _arr = newArr;
      _arr[_len++] = elem;
    } else {
      _arr[_len++] = elem;
    }
  }

  T removeAt(int index) {
    if (index > _len - 1 || index < 0) {
      throw Exception('Array index out of bounds');
    }

    final data = _arr[index]!;
    List<T?> newArray = List.filled(_len - 1, null);
    for (int x = 0, y = 0; x < _len; x++, y++) {
      if (x == index) {
        y--;
      } else {
        newArray[y] = _arr[x];
      }
    }

    _arr = newArray;
    _capacity = --_len;

    return data;
  }
}

class DynamicArrayIterator<T> extends Iterator<T> {
  DynamicArrayIterator(this.arr, this.length);
  final List<T?> arr;
  int length;
  int currentIndex = -1;

  @override
  T get current => arr[currentIndex]!;

  @override
  bool moveNext() {
    if (currentIndex + 1 >= length) {
      return false;
    }
    currentIndex++;
    return true;
  }
}
