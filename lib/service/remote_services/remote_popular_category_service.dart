import 'package:http/http.dart' as http;

import '../../const.dart';

class RemotePopularCategoryService {
  static const _popularCategoryEndpoint = '/api/popular-categories?populate=category,category.image&pagination[start]=0&pagination[limit]=5';

  Future<http.Response> get() async {
    final url = Uri.parse('$baseUrl$_popularCategoryEndpoint');
    try {
      final response = await http.get(url);
      print("Popular Category Received response: ${response.statusCode}");
      return response;
    } catch (e) {
      print("Error during GET request: $e");
      rethrow;
    }
  }
}
