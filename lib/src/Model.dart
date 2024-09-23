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
}
