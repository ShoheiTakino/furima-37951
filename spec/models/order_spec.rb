require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入する際のorderの挙動' do
    context '内容に問題がない場合' do
      it 'tokenが存在すれば出品する' do
        expect(@order).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'tokenが空では購入ができない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userと紐付いていなければ購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')
      end
      it 'itemと紐付いていなければ購入できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
