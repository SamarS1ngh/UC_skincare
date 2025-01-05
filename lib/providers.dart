import 'package:UCskincare/feature/routine/view_model/routine_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routineProvider =
    StateNotifierProvider<RoutineProvider, List<ImageWithTime?>>((ref) {
  return RoutineProvider();
});
