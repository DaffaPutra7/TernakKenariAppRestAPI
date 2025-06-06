import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pamlanjut_restapi/data/model/request/auth/register_request_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
