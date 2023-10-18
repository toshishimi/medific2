require 'rails_helper'

RSpec.describe TotalInfo, type: :model do
  before do
    user = FactoryBot.create(:user)
    @total_info = FactoryBot.build(:total_info, user_id: user.id)
  end


  describe "お薬登録" do
    context "新規登録できる場合" do
      it "すべての項目が存在すれば登録できる" do
        expect(@total_info).to be_valid
      end
      it "タイミングが空欄でも登録できる" do
        @total_info.medications[0].timing = nil
        expect(@total_info).to be_valid
      end
      it "回数が空欄でも登録できる" do
        @total_info.medications[0].individual = nil
        expect(@total_info).to be_valid
      end
      it "何日分が空欄でも登録できる" do
        @total_info.medications[0].days_supply = nil
        expect(@total_info).to be_valid
      end
      it "備考が空欄でも登録できる" do
        @total_info.medications[0].notes = nil
        expect(@total_info).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "薬をもらった日が空だと登録できない" do
        @total_info.date = nil
        @total_info.valid?
        expect(@total_info.errors.full_messages).to include("処方された日を入力してください")
      end
      it "病院名が空だと登録できない" do
        @total_info.hospital_name = nil
        @total_info.valid?
        expect(@total_info.errors.full_messages).to include("病院名を入力してください")
      end
      it "薬名が空だと登録できない" do
        @total_info.medications[0].medicine_name = nil
        @total_info.valid?
        expect(@total_info.errors.full_messages).to include("1の薬名を入力してください")
      end
      it "user_idが空だと登録できない" do
        @total_info.user_id = nil
        @total_info.valid?
        expect(@total_info.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
