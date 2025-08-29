class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: { value: true, message: "名前を入力してください" },
                   length: { maximum: 50, message: "名前は50文字以内で入力してください" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { value: true, message: "メールアドレスを入力してください" },
                    length: { maximum: 255, message: "メールアドレスは255文字以内です" },
                    format: { with: VALID_EMAIL_REGEX, message: "メールアドレスの形式が正しくありません" },
                    uniqueness: { message: "このメールアドレスはすでに登録されています" }

  has_secure_password
  validates :password, presence: { value: true, message: "パスワードを入力してください" },
                       length: { minimum: 6, message: "パスワードは6文字以上で入力してください" }
end

