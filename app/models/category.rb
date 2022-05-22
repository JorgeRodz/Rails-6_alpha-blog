class Category < ApplicationRecord
  before_save :actions # to execute this actions before save
  # associations
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name, presence: true, uniqueness: { case_sensitive: false },length: {minimum:3, maximum:25}

  #--------------- protected -----------------

  protected

  def actions
    self.name = name.downcase.titleize
  end
end