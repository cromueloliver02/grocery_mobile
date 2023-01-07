import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import './models.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? shipAddress;
  final List<Product> wishlist;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.shipAddress,
    required this.wishlist,
    required this.createdAt,
  });

  factory User.initial() {
    return User(
      id: '',
      name: '',
      email: '',
      shipAddress: null,
      wishlist: const [],
      createdAt: DateTime.now(),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      shipAddress,
      wishlist,
      createdAt,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, shipAddress: $shipAddress, wishlist: $wishlist, createdAt: $createdAt)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'shipAddress': shipAddress});
    result.addAll({'wishlist': wishlist.map((d) => d.id).toList()});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory User.fromDoc(
    DocumentSnapshot doc, {
    required List<Product> wishlist,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return User(
      id: doc.id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      shipAddress: map['shipAddress'] ?? '',
      wishlist: wishlist,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
