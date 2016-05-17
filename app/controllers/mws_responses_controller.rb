class MwsResponsesController < ApplicationController
  before_action :set_aws_response, only: [:show, :edit, :update, :destroy]

  # GET /aws_responses
  # GET /aws_responses.json
  def index
    @aws_responses = MwsResponse.all
  end

  # GET /aws_responses/1
  # GET /aws_responses/1.json
  def show
  end

  # GET /aws_responses/new
  def new
    @aws_response = MwsResponse.new
  end

  # GET /aws_responses/1/edit
  def edit
  end

  # POST /aws_responses
  # POST /aws_responses.json
  def create
    @aws_response = MwsResponse.new(aws_response_params)

    respond_to do |format|
      if @aws_response.save
        format.html { redirect_to @aws_response, notice: 'Aws response was successfully created.' }
        format.json { render :show, status: :created, location: @aws_response }
      else
        format.html { render :new }
        format.json { render json: @aws_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws_responses/1
  # PATCH/PUT /aws_responses/1.json
  def update
    respond_to do |format|
      if @aws_response.update(aws_response_params)
        format.html { redirect_to @aws_response, notice: 'Aws response was successfully updated.' }
        format.json { render :show, status: :ok, location: @aws_response }
      else
        format.html { render :edit }
        format.json { render json: @aws_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws_responses/1
  # DELETE /aws_responses/1.json
  def destroy
    @aws_response.destroy
    respond_to do |format|
      format.html { redirect_to aws_responses_url, notice: 'Aws response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aws_response
      @aws_response = MwsResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aws_response_params
      params.require(:aws_response).permit(:amazon_request_id, :next_token, :request_type, :page_num, :last_updated_before, :created_before)
    end
end
