class Category < ActiveRecord::Base
  validates_presence_of :name

  has_and_belongs_to_many :questions

  def self.questions_by_categories(category_names)
    Category.where(name: category_names).map(&:questions).flatten.uniq
  end
end