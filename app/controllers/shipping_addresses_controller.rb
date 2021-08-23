class ShippingAddressesController< ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end