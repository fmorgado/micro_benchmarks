library micro_benchmarks._objects;

final mapPerson = createMapPerson();

final classPerson = createClassPerson();

Map createMapPerson() => {
  'id': 0,
  'name': 'Tibúrio Bombulá',
  'age': 45,
  'address': {
    'street': 'Overthere 463',
    'code': '2345-678',
    'city': 'Overtheria'}
};

Person createClassPerson() => new Person(
  id: 0,
  name: 'Tibúrio Bombulá',
  age: 45,
  address: new Address(
    street: 'Overthere 463',
    code: '2345-678',
    city: 'Overtheria')
);

class Person {
  int         id;
  String      name;
  int         age;
  Address address;
  
  Person({
    this.id,
    this.name,
    this.age,
    this.address
  });
}

class Address {
  String street;
  String code;
  String city;
  
  Address({
    this.street,
    this.code,
    this.city
  });
}
