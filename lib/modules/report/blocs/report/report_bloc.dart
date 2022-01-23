import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'report_event.dart';
part 'report_state.dart';

@injectable
class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final HomeRepositoryInterface homeRepository;
  List<DocumentSnapshot>? documentList;
  ReportBloc(this.homeRepository) : super(ReportInitial()) {
    on<ReportEvent>((event, emit) async {
      if (event is FetchReportList) {
        try {
          emit(ReportLoading());

          documentList = await homeRepository.getReportList();
          if (documentList!.isEmpty) {
            emit(ReportFailed());
          }
        } catch (e) {
          emit(ReportFailed());
        }
      }
      if (event is FetchNextReportList) {
        try {
          emit(ReportLoading());
        } catch (e) {
          emit(ReportFailed());
        }
      }
    });
  }
}
