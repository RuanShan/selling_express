class MwsOrdersController < ApplicationController
  before_action :set_mws_order, only: [:show, :edit, :update, :destroy]

  # GET /mws_orders
  # GET /mws_orders.json
  def index
    @mws_orders = MwsOrder.all
  end

  # GET /mws_orders/1
  # GET /mws_orders/1.json
  def show
  end

  # GET /mws_orders/new
  def new
    @mws_order = MwsOrder.new
  end

  # GET /mws_orders/1/edit
  def edit
  end

  # POST /mws_orders
  # POST /mws_orders.json
  def create
    @mws_order = MwsOrder.new(mws_order_params)

    respond_to do |format|
      if @mws_order.save
        format.html { redirect_to @mws_order, notice: 'Mws order was successfully created.' }
        format.json { render :show, status: :created, location: @mws_order }
      else
        format.html { render :new }
        format.json { render json: @mws_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mws_orders/1
  # PATCH/PUT /mws_orders/1.json
  def update
    respond_to do |format|
      if @mws_order.update(mws_order_params)
        format.html { redirect_to @mws_order, notice: 'Mws order was successfully updated.' }
        format.json { render :show, status: :ok, location: @mws_order }
      else
        format.html { render :edit }
        format.json { render json: @mws_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mws_orders/1
  # DELETE /mws_orders/1.json
  def destroy
    @mws_order.destroy
    respond_to do |format|
      format.html { redirect_to mws_orders_url, notice: 'Mws order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mws_order
      @mws_order = MwsOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mws_order_params
      params.require(:mws_order).permit(:amazon_order_id, :seller_order_id, :purchase_date, :last_update_date, :order_status, :fulfillment_channel, :sales_channel, :order_channel, :ship_service_level, :amount, :currency_code, :address_line_1, :address_line_2, :address_line_3, :city, :county, :district, :state_or_region, :postal_code, :country_code, :phone, :number_of_items_shipped, :number_of_items_unshipped, :marketplace_id, :buyer_name, :buyer_email, :ship_service_level_category, :mws_response_id)
    end
end
