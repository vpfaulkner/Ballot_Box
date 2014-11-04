class API::V1::VotersController < ActionController::API
  before_filter :load_voter, only: [:show]


  def create
    @voter = Voter.new(voter_params)
    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: {errors: @voter.errors}, status: :bad_request
    end
  end

  def show
    render json: @voter
  end

  private

  def load_voter
    @voter = Voter.find(params[:id])
  end

  def voter_params
    params.require(:voter).permit(:name, :party)
  end

end
