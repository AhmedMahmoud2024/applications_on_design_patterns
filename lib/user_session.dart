class UserSession{
  UserSession._internal(){
    // private constructor for singleton pattern
    print('private constructor called');
  }
 static final UserSession _instance = UserSession._internal();
  static UserSession get instance => _instance;
  // simplified session data 
  String? _userId ;
  bool _isLoggedIn=false ;
   
   String? get userId=>_userId;
bool get isLoggedIn => _isLoggedIn;

  Future<void>  login(String userId) async{
 _userId=userId;
 _isLoggedIn = true ;

await _saveToSecureStorage(); 
 }

Future<void>  logout()async{
_userId=null;
_isLoggedIn=false ;
}
Future<void> _saveToSecureStorage() async{ //local using shafred preferences or hive
  // Here you would implement secure storage logic, e.g., using flutter_secure_storage
  // For simplicity, this is left unimplemented.
  // You can use packages like flutter_secure_storage to save the session data securely.
  print('User session saved to secure storage: $_userId');
}
}