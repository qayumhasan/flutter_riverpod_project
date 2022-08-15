import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUser();
});
