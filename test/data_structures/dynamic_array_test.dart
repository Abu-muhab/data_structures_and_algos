import 'package:data_structure_and_algos/data_structures/dynamic_array.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  late DynamicArray<int> myList;
  group('DynamicArray test', () {
    test(
        'Should be able to add several items ,retrieve them and maintain appropriate length',
        () {
      myList = DynamicArray();
      myList.add(1);
      myList.add(2);
      myList.add(3);

      expect(myList.get(0), 1);
      expect(myList.get(1), 2);
      expect(myList.get(2), 3);
      expect(myList.size(), 3);
    });

    test('Should be able to remove items and maintain appropriate length', () {
      myList.removeAt(1);
      myList.add(4);

      expect(myList.get(1), 3);
      expect(myList.get(2), 4);
      expect(myList.size(), 3);
    });

    test('Should be able to clear list and the add items', () {
      myList.clear();
      expect(myList.size(), 0);

      myList.add(100);
      expect(myList.get(0), 100);
    });
  });
}
