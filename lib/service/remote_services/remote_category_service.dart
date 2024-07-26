import 'package:http/http.dart' as http;
import 'package:my_ecomerce/const.dart';

class RemoteCategoryService{
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories?populate=image';

  Future<dynamic> get()async{
    try{
      var response = await http.get(Uri.parse(remoteUrl));
      print("statuscode of category fetch: ${response.statusCode}");
      return response;
    }
    catch(e)
    {
      print("Error during GET request: $e");
      rethrow;
    }
  }
}