import 'package:flutter/cupertino.dart';

class BlogsModel with ChangeNotifier{
  final int blogID;
  final String bloggerName;
  final String bloggDescription;
  final String bloggerQuote;
  final String bloggerReview;
  final String bloggerImage;
  //final String blogVideo;
//  final String blogVideoLink;
  final String blogDate;
  final String blogCreated_at;
  final String blogUpdated_at;

  BlogsModel(
      { this.blogID,
         this.bloggerName,
         this.bloggDescription,
         this.bloggerQuote,
         this.bloggerReview,
         this.bloggerImage,
        //   this.blogVideo,
        //   this.blogVideoLink,
         this.blogDate,
         this.blogCreated_at,
         this.blogUpdated_at});

  // factory BlogsItem.fromDocument(AsyncSnapshot doc, index) {
  //   return BlogsItem(
  //     blogID: doc.data[index]['id'],
  //     bloggerName: doc.data[index]['name'],
  //     bloggDescription: doc.data[index]['description'],
  //     bloggerQuote: doc.data[index]['quote'],
  //     bloggerReview: doc.data[index]['review'],
  //     bloggerImage: doc.data[index]['image'],
  //     //  blogVideo: doc.data[index]['video'],
  //     // blogVideoLink: doc.data[index]['link'],
  //     blogDate: doc.data[index]['date'],
  //     blogCreated_at: doc.data[index]['created_at'],
  //     blogUpdated_at: doc.data[index]['updated_at'],
  //   );
  // }
}