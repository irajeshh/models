import '../models.dart';
import 'typedefs.dart';

///Custom Extension to convert a list of models to a list of JSON objects
extension ListOfModels<T> on List<Model<T>> {
  ///Converts a list of models to a list of JSON objects
  List<Json> get toJsonsList {
    return map((final Model<T> model) => model.toJson).toList();
  }
}
