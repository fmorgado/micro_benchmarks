library micro_benchmarks.capability;

import 'dart:isolate';
import '_bench.dart';

main() {
  //final meh = new Capability();
  new BenchmarkSet('Capability Comparison')
    ..add(new _CapabilityBench())
    ..add(new _UnsafeCounterBench())
    ..add(new _SafeCounterBench())
    ..add(new _SafeCounterMapBench('Safe Map 0      ', {}))
    ..add(new _SafeCounterMapBench('Safe Map 20     ', {
      0:  0,
      45: 0,
      2345: 0,
      12342: 0,
      12345: 0,
      12542346: 0,
      123452345: 0,
      23463456: 0,
      1234523546: 0,
      23451: 0,
      12341: 0,
      568: 0,
      4578: 0,
      56895: 0,
      56896: 0,
      56897: 0,
      56898: 0,
      56899: 0,
      56800: 0,
      56801: 0
    }))
    ..report()
    ..report();
}

class _CapabilityBench extends BenchmarkBase {
  Capability result;
  _CapabilityBench(): super('Capability      ');
  void run() {
    final cap = new Capability();
    if (cap == result)
      print('meh');
    result = cap;
  }
}

class _UnsafeCounterBench extends BenchmarkBase {
  int _counter = 0;
  int result;
  _UnsafeCounterBench(): super('Unsafe Counter  ');
  void run() {
    final id = _counter++;
    if (id == result)
      print('meh');
    result = id;
  }
}

class _SafeCounterBench extends BenchmarkBase {
  int _counter = 0;
  int result;
  _SafeCounterBench(): super('Safe Counter    ');
  void run() {
    final id = _counter++;
    if (_counter > 0xFFFFFFF2)
      _counter = 0;
    if (id == result)
      print('meh');
    result = id;
  }
}

class _SafeCounterMapBench extends BenchmarkBase {
  Map<int, dynamic> existing;
  int _counter = 0;
  int result;
  _SafeCounterMapBench(String name, this.existing): super(name);
  void run() {
    int id = 0;
    do {
      id = _counter++;
      if (_counter > 0xFFFFFFF2)
        _counter = 0;
    } while(existing.containsKey(id));
    if (id == result)
      print('meh');
    result = id;
  }
}
