library micro_benchmarks.field_access;

import '_bench.dart';
import '_schema.dart';
import '_objects.dart';

main() {
  new BenchmarkSet('Field Getters')
    ..add(new _ReadMapBench(mapPerson))
    ..add(new _ReadClassBench(classPerson))
    ..add(new _ReadPropertyBench('Read Property', mapPerson, _idProperty, _nameProperty))
    ..add(new _ReadPropertyBench('Read Mirror', classPerson, _idMirrorField, _nameMirrorField))
    ..add(new _ReadPropertyBench('Read Closure', classPerson, _idClosureField, _nameClosureField))
    ..add(new _ReadPropertyBench('Read Custom', classPerson, const _PersonIdField(), const _PersonNameField()))
    ..report();
  
  new BenchmarkSet('Field Setters')
    ..add(new _WriteMapBench(mapPerson))
    ..add(new _WriteClassBench(classPerson))
    ..add(new _WritePropertyBench('Write Property', mapPerson, _idProperty, _nameProperty))
    ..add(new _WritePropertyBench('Write Mirror', classPerson, _idMirrorField, _nameMirrorField))
    ..add(new _WritePropertyBench('Write Closure', classPerson, _idClosureField, _nameClosureField))
    ..add(new _WritePropertyBench('Write Custom', classPerson, const _PersonIdField(), const _PersonNameField()))
    ..report();
}

const _idProperty = const Property('id');
const _nameProperty = const Property('name');

const _idMirrorField = const MirrorField('id', #id);
const _nameMirrorField = const MirrorField('name', #name);

int _getPersonId(Person target) => target.id;
void _setPersonId(Person target, int value) { target.id = value; }
const _idClosureField = const ClosureField('id', _getPersonId, _setPersonId);
String _getPersonName(Person target) => target.name;
void _setPersonName(Person target, String value) { target.name = value; }
const _nameClosureField = const ClosureField('name', _getPersonName, _setPersonName);

class _PersonIdField extends PropertyBase {
  const _PersonIdField(): super('id');
  int getValue(Person target) => target.id;
  void setValue(Person target, int value) { target.id = value; }
}
class _PersonNameField extends PropertyBase {
  const _PersonNameField(): super('name');
  String getValue(Person target) => target.name;
  void setValue(Person target, String value) { target.name = value; }
}

class _ReadMapBench extends BenchmarkBase {
  final Map person;
  _ReadMapBench(this.person): super('Read Map');
  void run() {
    final int id = person['id'];
    final String name = person['name'];
    if (id == null || name == null) print('meh');
  }
}

class _ReadClassBench extends BenchmarkBase {
  final Person person;
  _ReadClassBench(this.person): super('Read Class');
  void run() {
    final int id = person.id;
    final String name = person.name;
    if (id == null || name == null) print('meh');
  }
}

class _ReadPropertyBench extends BenchmarkBase {
  final person;
  final PropertyBase property1;
  final PropertyBase property2;
  _ReadPropertyBench(String name, this.person, this.property1, this.property2): super(name);
  void run() {
    final int id = property1.getValue(person);
    final String name = property2.getValue(person);
    if (id == null || name == null) print('meh');
  }
}

class _WriteMapBench extends BenchmarkBase {
  final Map person;
  _WriteMapBench(this.person): super('Write Map');
  void run() {
    person['id'] = 0;
    person['name'] = '';
  }
}

class _WriteClassBench extends BenchmarkBase {
  final Person person;
  _WriteClassBench(this.person): super('Write Class');
  void run() {
    person.id = 0;
    person.name = '';
  }
}

class _WritePropertyBench extends BenchmarkBase {
  final person;
  final PropertyBase property1;
  final PropertyBase property2;
  _WritePropertyBench(String name, this.person, this.property1, this.property2): super(name);
  void run() {
    property1.setValue(person, 0);
    property2.setValue(person, '');
  }
}
