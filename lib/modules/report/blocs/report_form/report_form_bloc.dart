import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repositories_interface.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_form_event.dart';
part 'report_form_state.dart';

@injectable
class ReportFormBloc extends Bloc<ReportFormEvent, ReportFormState> {
  final ReportRepositoryInterface reportRepository;
  final AuthRepositoryInterface authRepository;

  ReportFormBloc({required this.reportRepository, required this.authRepository})
      : super(ReportFormInitial()) {
    on<ReportFormEvent>((event, emit) async {
      if (event is ReportFormAdd) {
        try {
          emit(ReportFormLoading());
          var userId = authRepository.loggedUser.uid;
          await reportRepository.addReportForm(
            ReportFormModel(
              id: event.form.id,
              userId: userId,
              imageUrl: event.form.imageUrl,
              location: event.form.location,
              problem: event.form.problem,
              dateInput: event.form.dateInput,
              address: event.form.address,
              category: event.form.category,
              description: event.form.description,
            ),
          );
          emit(ReportFormAddedSucess(form: event.form));
        } catch (e, s) {
          ReportFormFailure(error: e, stackTrace: s);
        }
      }
    });
  }
}
