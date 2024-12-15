import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:batee5/a_core/constants/api_constants.dart';
import 'package:batee5/a_core/models/category.dart';
import 'package:batee5/a_core/models/product.dart';

class ApiService {
  final http.Client _client = http.Client();

  Future<Map<String, Category>> getCategories() async {
    final response = await _client.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.categories}'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data.map((key, value) => MapEntry(
        key,
        Category.fromJson(value as Map<String, dynamic>),
      ));
    }
    throw Exception('Failed to load categories');
  }

  Future<Map<String, Product>> getProductsByCategory(String category) async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.products}?category=$category'),
    );
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data.map((key, value) => MapEntry(
        key,
        Product.fromJson(key, value as Map<String, dynamic>),
      ));
    }
    throw Exception('Failed to load products');
  }

  Future<bool> toggleFavorite(String category, String productId) async {
    final response = await _client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.toggleFavorite(category, productId)}'),
    );
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['isFavorite'] as bool;
    }
    throw Exception('Failed to toggle favorite');
  }
}
