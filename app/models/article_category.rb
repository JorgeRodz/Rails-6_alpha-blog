class ArticleCategory < ApplicationRecord
  # associations
  belongs_to :article
  belongs_to :category
end