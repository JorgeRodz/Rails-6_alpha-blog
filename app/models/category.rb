class Category < ApplicationRecord
  before_save :actions # to execute this actions before save

  validates :name, presence: true, uniqueness: { case_sensitive: false },length: {minimum:3, maximum:25}

  #--------------- protected -----------------

  protected

  def actions
    self.name = name.downcase.titleize
  end
end