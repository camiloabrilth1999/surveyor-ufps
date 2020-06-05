class SelfEvaluations::SamplingInstrumentsController < ApplicationController
  def index
    redirect_to authenticated_root_url if current_user.has_role? :director_de_comite
  end

  def sampling_scheme
  end
end
