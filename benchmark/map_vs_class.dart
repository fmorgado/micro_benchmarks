library micro_benchmarks.map_vs_class;

import '_bench.dart';
import '_objects.dart';

main() {
  new BenchmarkSet('Map vs Class Creation')
    ..add(new _CreateMapBench())
    ..add(new _CreateClassBench())
    ..report();
  
  new BenchmarkSet('Map vs Class SimpleRead')
    ..add(new _SimpleReadMapBench(mapPerson))
    ..add(new _SimpleReadClassBench(classPerson))
    ..report();
  
  new BenchmarkSet('Map vs Class NestedRead')
    ..add(new _NestedReadMapBench(mapPerson))
    ..add(new _NestedReadClassBench(classPerson))
    ..report();
  
  new BenchmarkSet('Map vs Class SimpleWrite')
    ..add(new _SimpleWriteMapBench(mapPerson))
    ..add(new _SimpleWriteClassBench(classPerson))
    ..report();
  
  new BenchmarkSet('Map vs Class NestedWrite')
    ..add(new _NestedWriteMapBench(mapPerson))
    ..add(new _NestedWriteClassBench(classPerson))
    ..report();
}

class _NestedWriteMapBench extends BenchmarkBase {
  final Map person;
  _NestedWriteMapBench(this.person): super('NestedWrite Map');
  void run() {
    person['address']['code'] = '';
    person['address']['city'] = '';
  }
}

class _NestedWriteClassBench extends BenchmarkBase {
  final Person person;
  _NestedWriteClassBench(this.person): super('NestedWrite Class');
  void run() {
    person.address.code = '';
    person.address.city = '';
  }
}

class _SimpleWriteMapBench extends BenchmarkBase {
  final Map person;
  _SimpleWriteMapBench(this.person): super('SimpleWrite Map');
  void run() {
    person['id'] = 0;
    person['name'] = 'haha';
  }
}

class _SimpleWriteClassBench extends BenchmarkBase {
  final Person person;
  _SimpleWriteClassBench(this.person): super('SimpleWrite Class');
  void run() {
    person.id = 0;
    person.name = 'haha';
  }
}

class _NestedReadMapBench extends BenchmarkBase {
  final Map person;
  _NestedReadMapBench(this.person): super('NestedRead Map');
  void run() {
    final String code = person['address']['code'];
    final String city = person['address']['city'];
    if (code == null || city == null)
      print('meh');
  }
}

class _NestedReadClassBench extends BenchmarkBase {
  final Person person;
  _NestedReadClassBench(this.person): super('NestedRead Class');
  void run() {
    final String code = person.address.code;
    final String city = person.address.city;
    if (code == null || city == null)
      print('meh');
  }
}

class _SimpleReadMapBench extends BenchmarkBase {
  final Map person;
  _SimpleReadMapBench(this.person): super('SimpleRead Map');
  void run() {
    final int id = person['id'];
    final String name = person['name'];
    if (id == null || name == null)
      print('meh');
  }
}

class _SimpleReadClassBench extends BenchmarkBase {
  final Person person;
  _SimpleReadClassBench(this.person): super('SimpleRead Class');
  void run() {
    final int id = person.id;
    final String name = person.name;
    if (id == null || name == null)
      print('meh');
  }
}

class _CreateMapBench extends BenchmarkBase {
  Map result;
  _CreateMapBench(): super('Create Map');
  void run() {
    result = createMapPerson();
  }
}

class _CreateClassBench extends BenchmarkBase {
  Person result;
  _CreateClassBench(): super('Create Class');
  void run() {
    result = createClassPerson();
  }
}
