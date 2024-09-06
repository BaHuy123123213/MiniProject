import 'api_service.dart';
import 'user_model.dart';


void main(List<String> args) async {
  ApiService apiService = ApiService();
  print("Bắt đầu call API ");

  User? user = await apiService.fetchRandomUser();

  if(user != null){
    print("Data trả về");
    print("--------------");
    print("Gender : ${user.gender}");
    print("First Name : ${user.firstName}");
    print("Last Name : ${user.lastName}");
    print("Email : ${user.email}");
    print("Age : ${user.age}");
  }
}