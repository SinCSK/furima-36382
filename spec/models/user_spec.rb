require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context "ユーザー登録ができる場合" do
      it "全ての項目が入力されていれば登録できること" do
        expect(@user).to be_valid
      end
    end
    context "ユーザー登録ができない場合" do
      it "nicknameが空では登録できないこと" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含まなければ登録できないこと" do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが空だと登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字未満では登録できないこと" do
        @user.password = 'A0000'
        @user.password_confirmation = 'A0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが数字だけでは登録できないこと" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password . Include both letters and numbers')
      end
      it "passwordが英字だけでは登録できないこと" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password . Include both letters and numbers')
      end
      it "passwordに全角が含まれていると登録できないこと" do
        @user.password = 'A00000漢字'
        @user.password_confirmation = 'A00000漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password . Include both letters and numbers')
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できないこと" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name . Input full-width characters")
      end
      it "first_nameが空だと登録できないこと" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと" do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name . Input full-width characters")
      end
      it "last_name_kanaが空だと登録できないこと" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaがカタカナでなければ登録できないこと" do
        @user.last_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana . Input full-width katakana characters")
      end
      it "first_name_kanaが空だと登録できないこと" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaがカタカナでなければ登録できないこと" do
        @user.first_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana . Input full-width katakana characters")
      end
      it "birth_dateが空だと登録できないこと" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
