class API::V1::VotersController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :load_voter, only: [:show]
  before_filter :restrict_access_to_voter, only: [:show]


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

  def restrict_access_to_voter
    # HEADER AUTHENTICATION
    # authenticate_or_request_with_http_token do |token, options|
    #   @person.token == token
    # end

    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def voter_params
    params.require(:voter).permit(:name, :party)
  end

end
