class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  factory Person.fromMap(Map<String, Object> map) {
    final firstName = map["firstName"] as String;
    final lastName = map["lastName"] as String;
    return Person(firstName, lastName);
  }
}

void main() {
  // Create a person object
  final person = Person("Demetre", "Panjakidze");

  // Create a person object from map
  final person2 =
      Person.fromMap({"firstName": "Vaja", "lastName": "Panjakidze"});

  print("from a normal constructor: ${person.firstName} ${person.lastName}");
  print("from a factory constructor: ${person2.firstName} ${person2.lastName}");
}
