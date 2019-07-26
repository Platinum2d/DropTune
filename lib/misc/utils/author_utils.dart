import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/models/author.dart';

class AuthorUtils{
  static List<Author> getAllCachedAuthors(){
    return GetItReference.getIt.get<List<Author>>();
  }
}