library micro_benchmarks._schema;

import 'dart:mirrors';

typedef dynamic FieldGetter(target);

typedef void FieldSetter(target, value);

abstract class PropertyBase {
  final String name;
  
  const PropertyBase(this.name);
  
  dynamic getValue(target);
  
  void setValue(target, value);
}

class Property extends PropertyBase {
  const Property(String name): super(name);
  
  dynamic getValue(Map target) => target[this.name];
  
  void setValue(Map target, value) {
    target[this.name] = value;
  }
}

class MirrorField extends PropertyBase {
  final Symbol symbol;
  
  const MirrorField(String name, this.symbol): super(name);
  
  dynamic getValue(target) => reflect(target).getField(symbol).reflectee;
  
  void setValue(target, value) { reflect(target).setField(symbol, value); }
}

class ClosureField extends PropertyBase {
  final FieldGetter getter;
  final FieldSetter setter;
  
  const ClosureField(String name, this.getter, this.setter): super(name);
  
  dynamic getValue(target) => getter(target);
  
  void setValue(target, value) => setter(target, value);
}
