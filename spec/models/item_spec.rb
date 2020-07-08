require 'rails_helper'
describe Item do
  describe '#create' do
    # 1. nameが空では出品できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # 2. explanationが空では出品できないこと
    it "is invalid without a explanation" do
      item = build(:item, explanation: nil)
      item.valid?
      expect(item.errors[:explanation]).to include("を入力してください")
    end

    # 3. statusが空では出品できないこと
    it "is invalid without a status" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    # 4. sell_or_soldが空では出品できないこと
    it "is invalid without a sell_or_sold" do
      item = build(:item, sell_or_sold: nil)
      item.valid?
      expect(item.errors[:sell_or_sold]).to include("を入力してください")
    end

    # 5. delivery_burdenが空では出品できないこと
    it "is invalid without a delivery_burden" do
      item = build(:item, delivery_burden: nil)
      item.valid?
      expect(item.errors[:delivery_burden]).to include("を入力してください")
    end

    # 6. prefecture_idが空では出品できないこと
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    # 7. delivery_dayが空では出品できないこと
    it "is invalid without a delivery_day" do
      item = build(:item, delivery_day: nil)
      item.valid?
      expect(item.errors[:delivery_day]).to include("を入力してください")
    end

    # 8. priceが空では出品できないこと
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    # 9. user_idが空では出品できないこと
    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    # 10. category_idが空では出品できないこと
    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    # 11. imageが空では出品できないこと
    it "is invalid without a image" do
      image = build(:image, image: nil)
      item = build(:item)
      item.valid?
      expect(item.errors.full_messages).to include()
    end

    # 12. brandが空でも出品できること
    it "is valid without a brand" do
      item = build(:item, brand: nil)
      expect(item).to be_valid
    end

    # 13. 項目が全て入力された状態で出品できること
    it "is valid with all items" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 14. nameが41文字以上では出品できないこと
    it "is invalid with a name that has more than 41 characters" do
      item = build(:item, name: "a" * 41)
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    # 15. brandが41文字以上では出品できないこと
    it "is invalid with a brand that has more than 41 characters" do
      item = build(:item, brand: "a" * 41)
      item.valid?
      expect(item.errors[:brand]).to include("は40文字以内で入力してください")
    end

    # 16. explanationが1001文字以上では出品できないこと
    it "is invalid with a explanation that has more than 1001 characters" do
      item = build(:item, explanation: "a" * 1001)
      item.valid?
      expect(item.errors[:explanation]).to include("は1000文字以内で入力してください")
    end

    # 17. priceが299円以下では出品できないこと
    it "is invalid with a price less than 299 yen" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include()
    end

    # 18. priceが10,000,000円以上では出品できないこと
    it "is invalid with a price less than 10,000,000 yen" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include()
    end

  end
end