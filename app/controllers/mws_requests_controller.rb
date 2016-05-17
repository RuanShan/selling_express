class MwsRequestsController < ApplicationController
  before_action :set_mws_request, only: [:show, :edit, :update, :destroy]

  # GET /mws_requests
  # GET /mws_requests.json
  def index
    @mws_requests = MwsRequest.all
  end

  # GET /mws_requests/1
  # GET /mws_requests/1.json
  def show
  end

  # GET /mws_requests/new
  def new
    @mws_request = MwsRequest.new
  end

  # GET /mws_requests/1/edit
  def edit
  end

  # POST /mws_requests
  # POST /mws_requests.json
  def create
    @mws_request = MwsRequest.new(mws_request_params)

    respond_to do |format|
      if @mws_request.save
        format.html { redirect_to @mws_request, notice: 'Aws request was successfully created.' }
        format.json { render :show, status: :created, location: @mws_request }
      else
        format.html { render :new }
        format.json { render json: @mws_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mws_requests/1
  # PATCH/PUT /mws_requests/1.json
  def update
    respond_to do |format|
      if @mws_request.update(mws_request_params)
        format.html { redirect_to @mws_request, notice: 'Aws request was successfully updated.' }
        format.json { render :show, status: :ok, location: @mws_request }
      else
        format.html { render :edit }
        format.json { render json: @mws_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mws_requests/1
  # DELETE /mws_requests/1.json
  def destroy
    @mws_request.destroy
    respond_to do |format|
      format.html { redirect_to mws_requests_url, notice: 'Aws request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mws_request
      @mws_request = MwsRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mws_request_params
      params.require(:mws_request).permit(:amazon_request_id, :request_type)
    end
end
