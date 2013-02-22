class PasswordHasher
  LETTERS = ("a".."z").to_a
  NUMBERS = (0..9).to_a.map(&:to_s)
  UNSORTED_KEYS = LETTERS + NUMBERS

  def self.encrypt_password(password)
    randomized = UNSORTED_KEYS.shuffle.join('')
    hashed_password = password.split("").map do |key|
      randomized[UNSORTED_KEYS.index(key)]
    end.join('')

    { :encrypted_key => randomized, :hashed_password => hashed_password }
  end

  def self.decrypt_password(password, randomized)
    password.split("").map do |key|
      UNSORTED_KEYS[randomized.index(key)]
    end.join('')
  end
end