import '../models/thread_model.dart';

class SortFilter {
  void sortDescFavorites(List<ThreadModel> list) {
    if(list.isNotEmpty) {
      list.sort(((b, a) => a.favorites.compareTo(b.favorites)));
    }
  }

  List<ThreadModel> filterFavorites(List<ThreadModel> list, List<dynamic> favList) {
    return list.where((element) => favList.contains(element.id)).toList();
  }
} 