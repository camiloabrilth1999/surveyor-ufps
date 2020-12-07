class SelfEvaluations::SamplingInstruments::TeachersController < ApplicationController
  def index
    @teachers = Teacher.where(academic_program_id: current_user.academic_program_id)
    authorize @teachers
  end

  def import
    Teacher.import(params[:file], current_user.academic_program.id)
    redirect_to self_evaluations_sampling_instruments_teachers_url, notice: "Profesores importados."
  end
end
