class AdminUser < ApplicationRecord
  has_secure_password
  before_save :downcase_name

  private

  def downcase_name
    self.name = name.downcase
  end
end
