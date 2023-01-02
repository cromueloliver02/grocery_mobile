import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String shipAddress;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.shipAddress,
  });

  factory User.initial() {
    return const User(
      id: '',
      name: '',
      email: '',
      shipAddress: '',
    );
  }

  @override
  List<Object> get props => [id, name, email, shipAddress];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, shipAddress: $shipAddress)';
  }

  factory User.fromDoc(DocumentSnapshot doc) {
    final map = doc.data() as Map<String, dynamic>;

    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      shipAddress: map['shipAddress'] ?? '',
    );
  }
}
