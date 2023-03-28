class Category < ApplicationRecord
    validates :name, presence: true
    has_many :task_categories, dependent: :destroy
    has_many :tasks, through: :task_categories
end
