import 'package:e_commerce/features/cat_details/data/data_sources/cat_details_dto.dart';
import 'package:e_commerce/features/cat_details/data/repositories/cat_details_data_repo.dart';
import 'package:e_commerce/features/cat_details/domain/entities/CatDetailsEntity.dart';
import 'package:e_commerce/features/cat_details/domain/repositories/cat_details_domain_repo.dart';
import 'package:e_commerce/features/cat_details/domain/use_cases/cat_details_usecase.dart';
import 'package:e_commerce/features/cat_details/presentation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCubit extends Cubit<CatDetailsStates> {
  CatCubit(this.catDetailsDto) : super(CatInitState()) {
    catDetailsDomainRepo = CatDetailsDataRepo(catDetailsDto);
  }

  List<DataDetailsEntity> catDet = [];

  static CatCubit get(context) => BlocProvider.of(context);
  CatDetailsDto catDetailsDto;
  late CatDetailsDomainRepo catDetailsDomainRepo;

  getCatDetails(String catId) async {
    emit(CatLoadingState());
    CatDetailsUseCase catDetailsUseCase =
        CatDetailsUseCase(catDetailsDomainRepo);
    var result = await catDetailsUseCase.call(catId);

    result.fold((l) {
      emit(CatErrorState(l));
    }, (r) {
      catDet = r.data ?? [];
      emit(CatSuccessState(r));
    });
  }
}
