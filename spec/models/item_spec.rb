require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品登録" do
    context "商品が登録できる場合" do
      it "全ての項目が空でなければ登録できること" do
        expect(@item).to be_valid
      end
    end
    context "商品が登録できない場合" do
      it "imageが空では登録できないこと" do
      end
      it "item_nameが空では登録できないこと" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_showが空では登録できないこと" do
        @item.item_show = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item show can't be blank")
      end
      it "category_idが1だと登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが1だと登録できないこと" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_charge_idが1だと登録できないこと" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "prefecture_idが1だと登録できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_to_ship_idが1だと登録できないこと" do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it "priceが空では登録できないこと" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満であれば登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが9,999,999より大きければ登録できないこと" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceに数値以外の値が入力されていると登録できないこと" do
        @item.price = 'A300'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
