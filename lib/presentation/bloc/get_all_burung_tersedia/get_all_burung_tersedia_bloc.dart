import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_burung_tersedia_event.dart';
part 'get_all_burung_tersedia_state.dart';

class GetAllBurungTersediaBloc extends Bloc<GetAllBurungTersediaEvent, GetAllBurungTersediaState> {
  GetAllBurungTersediaBloc() : super(GetAllBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
