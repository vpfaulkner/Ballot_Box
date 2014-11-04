class API::V1::CanidatesController < ActionController::API
  before_filter :load_user, only: [:show]

  def index
    @canidates = Canidate.all
    render json: @canidates
  end

  def show
    render json: @canidate
  end

  private

  def load_user
    @canidate = Canidate.find(params[:id])
  end

end
