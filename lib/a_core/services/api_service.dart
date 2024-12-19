import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:batee5/a_core/constants/api_constants.dart';
import 'package:batee5/a_core/models/category.dart';
import 'package:batee5/a_core/models/product.dart';
import 'package:flutter/foundation.dart' as foundation;

class ApiService {
  final http.Client _client = http.Client();

  Future<Map<String, Category>> getCategories() async {
    try {
      final response = await _client.get(Uri.parse('${ApiConstants.baseUrl}${ApiConstants.categories}'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Debug print to see the response
        foundation.debugPrint('Categories API Response: $data');
        
        return data.map((key, value) => MapEntry(
          key,
          Category.fromJson(value as Map<String, dynamic>),
        ));
      }
      throw Exception('Failed to load categories: ${response.statusCode}');
    } catch (e) {
      foundation.debugPrint('Error in getCategories: $e');
      return {};
    }
  }

  Future<Map<String, Product>> getProductsByCategory(String category) async {
    try {
      final response = await _client.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.products}'),
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Debug print to see the response
        foundation.debugPrint('API Response: $data');
        
        final products = <String, Product>{};
        
        data.forEach((key, value) {
          try {
            products[key] = Product.fromJson(key, value as Map<String, dynamic>);
          } catch (e) {
            foundation.debugPrint('Error parsing product $key: $e');
          }
        });
        
        return products;
      }
      throw Exception('Failed to load products: ${response.statusCode}');
    } catch (e) {
      foundation.debugPrint('Error in getProductsByCategory: $e');
      return {};
    }
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
