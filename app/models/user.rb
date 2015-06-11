class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, 
                       uniqueness: true

  enum role: %w(default admin)
  # comes from AR::Base
  # instread of hard coding it below we use enum
  # def admin?
  #   role == 1
  # end

  # def default?
  #   role == 0
  # end

  # cool
end
