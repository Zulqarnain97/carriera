import 'package:carriera/Models/Blogs_Model.dart';
import 'package:carriera/Models/Videos_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogsProvider with ChangeNotifier {
  List<BlogsModel> _b = [];

  List<BlogsModel> get b {
    return [..._b];
  }





  Future<bool> fetchBlogs() async {
    const url = 'https://hospitality92.com/api/blogsbycategory_and_city/Tourism/1';

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData =
      json.decode(response.body)['blogs'] as List<dynamic>; // Map<String, dynamic>;
      print('after parsing $extractedData');
      print(extractedData);
      if (extractedData == null) {
        return false;
      }

      final List<BlogsModel> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(BlogsModel(
          blogID: prodData['id'],
          bloggerName: prodData['name'],
          bloggerQuote: prodData['quote'],
          bloggDescription: prodData['description'],
          bloggerReview: prodData['review'],
          bloggerImage: 'https://hospitality92.com/uploads/products/' + prodData['image'],
          blogDate: prodData['date'],
          blogCreated_at: prodData['created_at'],
          blogUpdated_at: prodData['updated_at'],


        ));
      });

      print('now printing my model data');
      loadedProducts.forEach((element) {
        print(element.blogDate);

        print(element.bloggerName);
        print(element.bloggDescription);
      });
      _b = loadedProducts;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
