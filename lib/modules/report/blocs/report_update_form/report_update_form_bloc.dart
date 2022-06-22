import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/repositories/report_repository_interface.dart';

part 'report_update_form_event.dart';
part 'report_update_form_state.dart';

@injectable
class ReportUpdateFormBloc
    extends Bloc<ReportUpdateFormEvent, ReportUpdateFormState> {
  final ReportRepositoryInterface reportRepository;

  ReportUpdateFormBloc(
    this.reportRepository,
  ) : super(ReportUpdateFormInitial()) {
    on<ReportUpdateFormAdd>((event, emit) async {
      try {
        emit(ReportUpdateFormLoading());
        String? imageUrl;

        if (event.imageFile != null) {
          final uploadTask =
              reportRepository.uploadReportImage(event.imageFile!);
          if (uploadTask != null) {
            await uploadTask.then((taskSnapshot) async {
              imageUrl = await taskSnapshot.ref.getDownloadURL();
            });
          }
        }

        await reportRepository.updateReportStatus(
          event.id,
          ReportProgressModel(
            statusType: event.data.statusType,
            date: event.data.date,
            statusProgress: event.data.statusProgress,
            description: event.data.description,
            imageUrl: imageUrl,
          ),
        );
        emit(ReportUpdateFormSuccess());
      } catch (e, s) {
        emit(ReportUpdateFormFailed(e, s));
      }
    });

    on<ReportUpdateFormDelete>((event, emit) async {
      try {
        emit(ReportUpdateFormLoading());
        await reportRepository.deleteReportById(event.id);
        emit(ReportUpdateFormDeleteSuccess());
      } catch (e, s) {
        emit(ReportUpdateFormFailed(e, s));
      }
    });
  }
}
