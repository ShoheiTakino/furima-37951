require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe 'Address情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'address2は空でも保存できること' do
        @address.address2 = ''
        expect(@address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeがハイフンが無ければ保存できないこと' do
        @address.postal_code = 0o123456
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'province_idを選択していないと保存できないこと' do
        @address.province_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Province is not a number')
      end
      it 'cityが空だと保存できないこと' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空では保存できないこと' do
        @address.address1 = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'phoneが空では保存できないこと' do
        @address.phone = ''
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは9桁以下の数値は保存できないこと' do
        @address.phone = 123_456_789
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは12桁以上の数値は保存できないこと' do
        @address.phone = 123_456_789_012
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは半角数字以外は保存できないこと' do
        @address.phone = '０１２３４５６７８９'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneはハイフン(-)が含まれると保存できないこと' do
        @address.phone = 0o120 - 0o12 - 0o12
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone is invalid')
      end
      it 'orderが紐付いていないと保存できないこと' do
        @address.order = nil
        @address.valid?
        expect(@address.errors.full_messages).to include('Order must exist')
      end
    end
  end
end
