import 'package:http/http.dart' as http;

import '../../const.dart';

class RemoteBannerService {
  static const _bannersEndpoint = '/api/banners?populate=image';

  Future<http.Response> get() async {
    final url = Uri.parse('$baseUrl$_bannersEndpoint');
    try {
      final response = await http.get(url);
      print("Banner Received response: ${response.statusCode}");
      return response;
    } catch (e) {
      print("Error during GET request: $e");
      rethrow;
    }
  }
}
