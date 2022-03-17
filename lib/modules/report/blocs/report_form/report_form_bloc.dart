import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/core/repositories/auth_repository_interface.dart';
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
      if (event is ReportFormAddAll) {
        try {
          var userId = authRepository.loggedUser.uid;

          await reportRepository.addReportForm(
            ReportFormModel(
              id: event.form.id,
              userId: userId,
              imageUrl: event.imageUrl,
              location: event.form.location,
              problem: event.form.problem,
              dateInput: event.form.dateInput,
              address: event.form.address,
              category: event.form.category,
              description: event.form.description,
            ),
          );
          emit(ReportFormAddedSucess());
        } catch (e, s) {
          emit(ReportFormFailure(error: e, stackTrace: s));
        }
      }
      if (event is ReportFormAdd) {
        emit(ReportFormLoading());
        final uploadTask = reportRepository.uploadReportImage(event.imageFile);
        if (uploadTask != null) {
          await uploadTask.then((taskSnapshot) async {
            final imageUrl = await taskSnapshot.ref.getDownloadURL();
            add(ReportFormAddAll(form: event.form, imageUrl: imageUrl));
          });
        }
      }
    });
  }
}
