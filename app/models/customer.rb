class Customer < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  def self.search(query)
    self.where('name LIKE :query OR
                email LIKE :query OR
                street LIKE :query OR
                post_code LIKE :query OR
                city LIKE :query',
                query: "%#{query}%")
  end
end
