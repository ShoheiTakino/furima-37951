require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
   end
  
  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it 'image,content,category_id,status_id,shipfee_id,province_id,shipping_id,priceが存在すれば出品する' do
        expect(@item).to be_valid 
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では登録ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end
      it 'nameが空では出品ができない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空では出品ができない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'category_idが空では出品ができない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では出品ができない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'province_idが空では出品ができない' do
        @item.province_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Province can't be blank")
      end
      it 'shipping_idが空では出品ができない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'shipfee_idが空では出品ができない' do
        @item.shipfee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipfee can't be blank")
      end
      it 'priceが空では出品ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは全角数字では出品ができない' do
        @item.price = "１１１１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが299円以下では出品ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
