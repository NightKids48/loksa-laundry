import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lestari_laundry/user/domain/base/authentication_headers_request.dart';
import '../../../../../../base/base_config/base_config.dart';
import '../../../../../../base/result_entity/result_entity.dart';
import '../../../../../../domain/model/data/kilogram_product.dart/kilogram_data.dart';
import '../../../../../../domain/repository/kilogram/kilogram_repository.dart';

part 'kilogram_state.dart';

class KilogramCubit extends Cubit<KilogramState> {
  final KilogramRepository repository;

  KilogramCubit(this.repository) : super(KilogramInitial());

  Future<void> fetchKilogram() async {
    emit(KilogramIsLoading());

    //final token = await Commons().getToken();
    final tokenManual = BaseConfig.TOKEN;
    if (tokenManual != '') {
      final response = await repository.fetchKilogram(
        AuthenticationHeadersRequest(tokenManual),
      );

      if (response is ResultSuccess) {
        emit(KilogramIsSucces(data: (response as ResultSuccess).data));
      } else {
        emit(KilogramIsFailed(message: (response as ResultError).message));
      }
    } else {
      emit(
        KilogramIsFailed(message: 'Forbidden'),
      );
    }
  }
}
