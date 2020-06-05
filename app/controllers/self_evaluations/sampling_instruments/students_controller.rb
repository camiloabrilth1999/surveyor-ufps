class SelfEvaluations::SamplingInstruments::StudentsController < ApplicationController
  def index
    @students = Student.where(semester: params[:semesters], academic_program_id: current_user.academic_program_id)
    authorize @students
  end

  def import
    Student.import(params[:file], current_user.academic_program.id)
    redirect_to self_evaluations_sampling_instruments_students_url, notice: "Estudiantes importados."
  end

  def index_semester
    @students = Student.where(semester: params[:semesters], academic_program_id: current_user.academic_program_id)
    authorize @students
  end

  def index_semester_post
    redirect_to index_semester_other_self_evaluations_sampling_instruments_students_url(params[:semesters])
  end
end
