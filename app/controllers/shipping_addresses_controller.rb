class ShippingAddressesController< ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @purchase = PurchaseForm.new
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,            # 商品の値段
      card: purchase_params[:token],  # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    item = Item.find(params[:item_id])
    unless user_signed_in? && current_user.id != item.user_id && item.purchase.present?
      redirect_to action: :index
    end
  end

end