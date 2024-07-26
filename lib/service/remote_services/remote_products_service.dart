import 'package:http/http.dart' as http;
import 'package:my_ecomerce/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products?populate=images,tags';

  Future<dynamic> get()async{
    try{
      final response = await http.get(Uri.parse(remoteUrl));
      print("recived statuscode from product : ${response.statusCode}");
      return response;
    }
    catch(e)
    {
      print("Error during GET request: $e");
      rethrow;
    }
  }
  Future<dynamic> getByName({required String key})async{
    try{
      final response = await http.get(Uri.parse('$remoteUrl&filters[name][\$contains]=$key'));
      print("recived statuscode from product get by name : ${response.statusCode}");
      return response;
    }
    catch(e)
    {
      print("Error during GET request: $e");
      rethrow;
    }
  }
  Future<dynamic> getByCategory({required int id})async{
    try{
      final response = await http.get(Uri.parse('$remoteUrl?populate=images,tags&filters[category][id]=$id'));
      print("recived statuscode from product get by category : ${response.statusCode}");
      return response;
    }
    catch(e)
    {
      print("Error during GET request: $e");
      rethrow;
    }
  }
}
