require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '商品購入機能' do
    context "商品購入ができる場合" do
      it "全ての項目が入力されていれば登録できること" do
        expect(@purchase_form).to be_valid
      end
      it "buildingが空でも登録できること" do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
    end
    context "商品購入ができない場合" do
      it "tokenが空だと登録できないこと" do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと登録できないこと" do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeが全角文字だと登録できない" do
        @purchase_form.postal_code = '０００−００００'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "postal_codeが「3桁ハイフン4桁」以外だと登録できない" do
        @purchase_form.postal_code = '00-00000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it "cityが空だと登録できないこと" do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと登録できないこと" do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと登録できないこと" do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが数値以外だと登録できないこと" do
        @purchase_form.phone_number = 'abcdefghifk'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number . Input only number")
      end
      it "phone_numberが全角だと登録できないこと" do
        @purchase_form.phone_number = '０００００００００００'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number . Input only number")
      end
      it "phone_numberが10桁以上11桁以内でないと登録できないこと" do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number . Input only number")
      end
      it "prefecture_idが1だと登録できないこと" do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "userが紐づいていなければ登録できないこと" do
        @purchase_form.user_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていなければ登録できないこと" do
        @purchase_form.item_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end