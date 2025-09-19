import 'package:ab_ecommerce_admin_panel/utils/constants/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/constants/enums.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  AppRole role;
  String profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName = '',
    this.lastName = '',
    required this.email,
    this.phoneNumber = '',
    this.username = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createdAt,
    this.updatedAt,
  });

  String get fullName => '$firstName $lastName';
  String get formattedDate => AbFormatter.formatDate(createdAt);
  String get formattedUpdateDate => AbFormatter.formatDate(updatedAt);
  String get formattedPhoneNumber => AbFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(String fullName) => fullName.split(' ');

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split('');
    String first = nameParts[0].toLowerCase();
    String last = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    return 'cwab_$first$last';
  }

  // String get formattedPhoneNumber => AbFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to create empty user model
  static UserModel empty() =>
      UserModel(email: '');

  /// Convert user model to JSON format to store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'username': username,
      'profilePicture': profilePicture,
      'role': role.name.toString(),
      'createdAtt': createdAt,
      'updatedAtt': updatedAt,
    };
  }

  /// Factory method to create user model from firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null){
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data.containsKey('firstName') ? data['firstName'] ?? '' : '',
        lastName: data.containsKey('lastName') ? data['lastName'] ?? '' : '',
        email: data.containsKey('email') ? data['email'] ?? '' : '',
        phoneNumber: data.containsKey('phoneNumber') ? data['phoneNumber'] ?? '' : '',
        username: data.containsKey('username') ? data['username'] ?? '' : '',
        role:  data.containsKey('role') ? (data['role'] ?? AppRole.user) == AppRole.admin.name.toString() ? AppRole.admin : AppRole.user : AppRole.user,
        profilePicture: data.containsKey('profilePicture') ? data['profilePicture'] ?? '' : '',
        createdAt: data.containsKey('createdAt') ? data['createdAt']?.toDate() ?? DateTime.now() : DateTime.now(),
        updatedAt: data.containsKey('updatedAt') ? data['updatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      );
    } else {
      // Return an empty model or throw a custom error
      return UserModel.empty();
    }
  }
}
