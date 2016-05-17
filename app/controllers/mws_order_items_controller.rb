class MwsOrderItemsController < ApplicationController
  before_action :set_mws_order_item, only: [:show, :edit, :update, :destroy]

  # GET /mws_order_items
  # GET /mws_order_items.json
  def index
    @mws_order_items = MwsOrderItem.all
  end

  # GET /mws_order_items/1
  # GET /mws_order_items/1.json
  def show
  end

  # GET /mws_order_items/new
  def new
    @mws_order_item = MwsOrderItem.new
  end

  # GET /mws_order_items/1/edit
  def edit
  end

  # POST /mws_order_items
  # POST /mws_order_items.json
  def create
    @mws_order_item = MwsOrderItem.new(mws_order_item_params)

    respond_to do |format|
      if @mws_order_item.save
        format.html { redirect_to @mws_order_item, notice: 'Mws order item was successfully created.' }
        format.json { render :show, status: :created, location: @mws_order_item }
      else
        format.html { render :new }
        format.json { render json: @mws_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mws_order_items/1
  # PATCH/PUT /mws_order_items/1.json
  def update
    respond_to do |format|
      if @mws_order_item.update(mws_order_item_params)
        format.html { redirect_to @mws_order_item, notice: 'Mws order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @mws_order_item }
      else
        format.html { render :edit }
        format.json { render json: @mws_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mws_order_items/1
  # DELETE /mws_order_items/1.json
  def destroy
    @mws_order_item.destroy
    respond_to do |format|
      format.html { redirect_to mws_order_items_url, notice: 'Mws order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mws_order_item
      @mws_order_item = MwsOrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mws_order_item_params
      params.require(:mws_order_item).permit(:asin, :amazon_order_item_id, :seller_sku, :title, :quantity_ordered, :quantity_shipped, :item_price, :item_price_currency, :shipping_price, :shipping_price_currency, :gift_price, :gift_price_currency, :item_tax, :item_tax_currency, :shipping_tax, :shipping_tax_currency, :gift_tax, :gift_tax_currency, :shipping_discount, :shipping_discount_currency, :promotion_discount, :promotion_discount_currency, :gift_wrap_level, :gift_message_text, :mws_order_id, :amazon_order_id)
    end
end
