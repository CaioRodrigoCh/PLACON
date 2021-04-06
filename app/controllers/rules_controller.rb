class RulesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @q = Topico.includes(:subtopico).order(created_at: :asc)
    @topicos = @q

  end

  def new
  end

  def create
  end

  def rules_path
    redirect_to rules_path
  end
end
