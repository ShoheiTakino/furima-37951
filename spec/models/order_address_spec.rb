require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'OrderとAddress情報の保存' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end

  
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'address2は空でも保存できること' do
        @order_address.address2 = ''
        expect(@order_address).to be_valid
      end
      it 'tokenが存在すれば出品する' do
        expect(@order_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid.")
      end
      it 'postal_codeがハイフンが無ければ保存できないこと' do
        @order_address.postal_code = 0123456
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid.")
      end
      it 'province_idを選択していないと保存できないこと' do
        @order_address.province_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Province can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空では保存できないこと' do
        @order_address.address1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'phoneが空では保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneは9桁以下の数値は保存できないこと' do
        @order_address.phone = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneは12桁以上の数値は保存できないこと' do
        @order_address.phone = 123456789012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneは半角数字以外は保存できないこと' do
        @order_address.phone = '０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'phoneはハイフン(-)が含まれると保存できないこと' do
        @order_address.phone = 0120-012-012
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid.")
      end
      it 'tokenが空では購入ができない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
