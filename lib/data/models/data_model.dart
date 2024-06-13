class Classlist {
  final String name;
  final String email;
  final String child;

  Classlist({required this.name, required this.email, required this.child});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'child': child,
    };
  }

  factory Classlist.fromJson(Map<String, dynamic> map) {
    return Classlist(
      name: map['name'] as String,
      email: map['email'] as String,
      child: map['child'] as String,
    );
  }
}

class ClasslistFiltered {
  final String name;

  ClasslistFiltered({required this.name});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory ClasslistFiltered.fromJson(Map<String, dynamic> map) {
    return ClasslistFiltered(
      name: map['name'] as String,
    );
  }
}
