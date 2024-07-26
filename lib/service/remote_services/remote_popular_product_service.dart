import 'package:http/http.dart' as http;
import 'package:my_ecomerce/const.dart';

class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-products?populate=product,product.images';

  Future<dynamic> get()async{
    try{
      final response = await http.get(Uri.parse(remoteUrl));
      print("recived statuscode from popular product : ${response.statusCode}");
      return response;
    }
    catch(e)
    {
      print("Error during GET request: $e");
      rethrow;
    }
  }
}