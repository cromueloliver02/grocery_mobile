import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import './models.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? shipAddress;
  final List<WishlistItem> wishlist;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.shipAddress,
    required this.wishlist,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory User.initial() {
    return User(
      id: '',
      name: '',
      email: '',
      shipAddress: null,
      wishlist: const <WishlistItem>[],
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

  User copyWith({
    String Function()? id,
    String Function()? name,
    String Function()? email,
    String? Function()? shipAddress,
    List<WishlistItem> Function()? wishlist,
    DateTime Function()? createdAt,
  }) {
    return User(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      email: email != null ? email() : this.email,
      shipAddress: shipAddress != null ? shipAddress() : this.shipAddress,
      wishlist: wishlist != null ? wishlist() : this.wishlist,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'shipAddress': shipAddress});
    result.addAll({
      'wishlist': wishlist.map((WishlistItem d) => d.toMap()).toList(),
    });
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory User.fromDoc(
    DocumentSnapshot doc, {
    required List<WishlistItem> wishlist,
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
