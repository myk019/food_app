
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/feature/auth/repository/auth_repository.dart';
import 'package:food_app/model/user_model.dart';

final usercontrollerprovider=Provider((ref) => UserController(authrepository: ref.watch(authrepositoryprovider)));

class UserController{
  final Authrepository _authrepository;
  UserController({required Authrepository authrepository}):
      _authrepository=authrepository;



  userFunction({required name,required email,required password,required image,required id}){
    _authrepository.UserDetails(name, email, password,image,id);
}
loginFun(email,password,context){
    _authrepository.emailLogin(email, password, context);
}

googleFunction(context){
    _authrepository.signInWithGoogle(context);
}
  googleNewUserController(name,email,password,image,id){
    _authrepository.googleNewUser(name, email, password, image, id);
  }

// newGoogleFunction(context){
//     _authrepository.signInCreateUser(context);
// }
}