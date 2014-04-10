class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile

  validates :user_id, uniqueness: true, presence: true

  def to_param
    "#{id}-#{user.name}".parameterize
  end

end
