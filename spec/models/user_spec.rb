require 'rails_helper'

RSpec.describe User, type: :model do

  it 'ニックネーム、メーアドレス、パスワード、姓、名、姓（カナ）、名（カナ）、生年月日、送付先・姓、送付先・名、送付先・姓（カナ）、送付先・名（カナ）、郵便番号、都道府県、市区町村、番地、がある場合、有効である' do 
    user = build(:user)
    expect(user).to be_valid
  end

  it 'ニックネームがない場合、無効である' do
    user = build(:user, nickname: "")
    user.valid?
    expect(user.errors[:nickname]).to include("を入力してください")
  end
    
  it 'メールアドレスがない場合、無効である' do 
    user = build(:user, email: "")
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it '重複したメールアドレスの場合、無効である' do 
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("はすでに存在します")
  end

  it 'メールアドレスに@とドメインがない場合、無効である' do
    user = build(:user, email: 'aaa')
    user.valid?
    expect(user.errors[:email]).to include("は不正な値です")
  end

  it 'パスワードがない場合、無効である' do 
    user = build(:user, password: '')
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it 'パスワードが7文字以上ない場合、無効である' do
    user = build(:user, password: '111111')
    user.valid?
    expect(user.errors[:password]).to include('は7文字以上で入力してください')
  end

  it 'パスワードが確認用と一致していない場合、無効である' do
    user = build(:user, password_confirmation: 'bbbbbbbb')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
  end

  it 'パスワード（確認用）がない場合、無効である' do
    user = build(:user, password_confirmation: '')
    user.valid?
    expect(user.errors[:password_confirmation]).to include('を入力してください')
  end

  it '姓がない場合、無効である' do
    user = build(:user, last_name: '')
    user.valid?
    expect(user.errors[:last_name]).to include('を入力してください')
  end

  it '姓に半角文字が含まれている場合、無効である' do
    user = build(:user, last_name: '山田a')
    user.valid?
    expect(user.errors[:last_name]).to include('は不正な値です')
  end

  it '名がない場合、無効である' do
    user = build(:user, first_name: '')
    user.valid?
    expect(user.errors[:first_name]).to include('を入力してください')
  end

  it '名に半角文字が含まれている場合、無効である' do
    user = build(:user, first_name: '太郎a')
    user.valid?
    expect(user.errors[:first_name]).to include('は不正な値です')
  end

  it '姓（カナ）がない場合、無効である' do
    user = build(:user, last_name_furi: '')
    user.valid?
    expect(user.errors[:last_name_furi]).to include('を入力してください')
  end

  it '姓（カナ）に半角文字が含まれている場合、無効である' do
    user = build(:user, last_name_furi: '山田a')
    user.valid?
    expect(user.errors[:last_name_furi]).to include('は不正な値です')
  end

  it '名（カナ）がない場合、無効である' do
    user = build(:user, first_name_furi: '')
    user.valid?
    expect(user.errors[:first_name_furi]).to include('を入力してください')
  end

  it '名（カナ）に半角文字が含まれている場合、無効である' do
    user = build(:user, first_name_furi: '太郎a')
    user.valid?
    expect(user.errors[:first_name_furi]).to include('は不正な値です')
  end

  it '送付先・姓がない場合、無効である' do
    user = build(:user, send_last_name: '')
    user.valid?
    expect(user.errors[:send_last_name]).to include('を入力してください')
  end

  it '送付先・名がない場合、無効である' do
    user = build(:user, send_first_name: '')
    user.valid?
    expect(user.errors[:send_first_name]).to include('を入力してください')
  end

  it '送付先・姓（カナ）がない場合、無効である' do
    user = build(:user, send_last_name_furi: '')
    user.valid?
    expect(user.errors[:send_last_name_furi]).to include('を入力してください')
  end

  it '送付先・名（カナ）がない場合、無効である' do
    user = build(:user, send_first_name_furi: '')
    user.valid?
    expect(user.errors[:send_first_name_furi]).to include('を入力してください')
  end

  it '郵便番号がない場合、無効である' do
    user = build(:user, post: '')
    user.valid?
    expect(user.errors[:post]).to include('を入力してください')
  end

  it '都道府県がない場合、無効である' do
    user = build(:user, prefecture: '')
    user.valid?
    expect(user.errors[:prefecture]).to include('を入力してください')
  end

  it '市区町村がない場合、無効である' do
    user = build(:user, city: '')
    user.valid?
    expect(user.errors[:city]).to include('を入力してください')
  end

  it '番地がない場合、無効である' do
    user = build(:user, block: '')
    user.valid?
    expect(user.errors[:block]).to include('を入力してください')
  end

end
