// id : 1001
// imageUrl : "https://hub.dummyapis.com/Image?text=MS&height=120&width=120"
// firstName : "Maureen"
// lastName : "Sporer"
// email : "Maureen.Sporer@dummyapis.com"
// contactNumber : "4430596305"
// age : 40
// dob : "07/08/1985"
// salary : 1
// address : "Address1"

class Employee {
  Employee({
    num? id,
    String? imageUrl,
    String? firstName,
    String? lastName,
    String? email,
    String? contactNumber,
    num? age,
    String? dob,
    num? salary,
    String? address,
  }) {
    _id = id;
    _imageUrl = imageUrl;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _contactNumber = contactNumber;
    _age = age;
    _dob = dob;
    _salary = salary;
    _address = address;
  }

  Employee.fromJson(dynamic json) {
    _id = json['id'];
    _imageUrl = json['imageUrl'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _contactNumber = json['contactNumber'];
    _age = json['age'];
    _dob = json['dob'];
    _salary = json['salary'];
    _address = json['address'];
  }
  num? _id;
  String? _imageUrl;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _contactNumber;
  num? _age;
  String? _dob;
  num? _salary;
  String? _address;

  num? get id => _id;
  String? get imageUrl => _imageUrl;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get contactNumber => _contactNumber;
  num? get age => _age;
  String? get dob => _dob;
  num? get salary => _salary;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['imageUrl'] = _imageUrl;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['contactNumber'] = _contactNumber;
    map['age'] = _age;
    map['dob'] = _dob;
    map['salary'] = _salary;
    map['address'] = _address;
    return map;
  }
}
