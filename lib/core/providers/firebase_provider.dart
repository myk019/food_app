import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod/riverpod.dart';

final firestoreprovider = Provider((ref) => FirebaseFirestore.instance);
final authprovider = Provider((ref) => FirebaseAuth.instance);