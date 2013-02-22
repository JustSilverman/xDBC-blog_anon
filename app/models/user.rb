class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :posts

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, :unless => Proc.new {|user| user.status == 3 }
  before_create :hash_password

  def self.authenticate(email, attempt)
    user = User.find_by_email(email)
    if user
      password = PasswordHasher.decrypt_password(user.encrypted_password, user.encrypted_key)
      password == attempt ? user : nil
    end
  end

  def hash_password
    hashed = PasswordHasher.encrypt_password(self.encrypted_password)
    self.encrypted_password  = hashed[:hashed_password]
    self.encrypted_key       = hashed[:encrypted_key]
  end
end
