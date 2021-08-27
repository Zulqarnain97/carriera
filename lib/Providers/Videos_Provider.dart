import 'package:carriera/Models/Videos_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class VideosProvider with ChangeNotifier {
  List<VideosModel> _t = [];

  List<VideosModel> get t {
    return [..._t];
  }

  VideosModel findByid(String id) {
    return _t.firstWhere((w) => w.id == id);
  }



  Future<bool> fetchVideos() async {
    const url = 'https://hospitality92.com/api/getvideos';

    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final extractedData =
      json.decode(response.body)['videos'] as List<dynamic>; // Map<String, dynamic>;
      print('after parsing $extractedData');
      print(extractedData);
      if (extractedData == null) {
        return false;
      }

      final List<VideosModel> loadedProducts = [];
      extractedData.forEach((prodData) {
        loadedProducts.add(VideosModel(
          id: prodData['id'],
          description: prodData['description'],
          status: prodData['status'],
          video: prodData['video'],
          link: prodData['link'],
          date: prodData['date'],


        ));
      });

      print('now printing my model data');
      loadedProducts.forEach((element) {
        print(element.id);

        print(element.video);
        print(element.link);
      });
      _t = loadedProducts;
      notifyListeners();
      return true;
    } catch (error) {
      return false;
    }
  }
}
