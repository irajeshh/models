part of '../models.dart';

///A standard model to reduce the redundancy of documentation
///and also it helps to reduce fogetting the important functions of a class
abstract class Model extends Equatable {
  ///Constructor
  const Model();

  // ///To create model from given JSON data
  //  Model fromJson(final Json json) {
  //   // ignore: only_throw_errors
  //   throw 'Sample error';
  // }

  ///Returns the data in Json format
  Map<String, dynamic> get toJson;

  ///Creates new instance of the Object
  Model copyWith();

  @override
  String toString() {
    return toJson.toString();
  }

  @override
  List<dynamic> get props => toJson.values.toList();

  ///This searches if any word is available in this Model data
  bool containsQuery(
    final String q, {
    final List<String> extraParams = const <String>[],
  }) {
    final List<String> tags = q.replaceAll(',', ' ').replaceAll('  ', '').split(' ').where((final String e) => e.trim().filtered.isNotEmpty).toList();
    bool contains = false;
    if (tags.isNotEmpty) {
      for (final String tag in tags) {
        contains = <dynamic>[...props, ...extraParams].equatable.contains(tag.equatable);
        if (contains) {
          break;
        }
      }
    } else {
      contains = true;
    }
    return contains;
  }
}

extension ModelExtension on List<Model> {
  ///Models to Jsons list
  List<Map<String, dynamic>> get toJsons {
    return map((final Model m) => m.toJson).toList();
  }
}
