class Student {
  final String id;
  final String name;
  final DateTime? birthDate;
  final int cpf;
  final String email;
  final int academicRecord;

  const Student({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.cpf,
    required this.email,
    required this.academicRecord,
  });

  factory Student.empty() {
    return const Student(
      id: '',
      name: '',
      birthDate: null,
      cpf: -1,
      email: '',
      academicRecord: -1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthdate': birthDate?.millisecondsSinceEpoch,
      'cpf': cpf,
      'email': email,
      'academic_record': academicRecord,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      birthDate: map['birthdate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['birthdate'])
          : null,
      cpf: map['cpf'],
      email: map['email'],
      academicRecord: map['academic_record'],
    );
  }

  Student copyWith({
    String? id,
    String? name,
    DateTime? birthDate,
    int? cpf,
    String? email,
    int? academicRecord,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      cpf: cpf ?? this.cpf,
      email: email ?? this.email,
      academicRecord: academicRecord ?? this.academicRecord,
    );
  }
}
