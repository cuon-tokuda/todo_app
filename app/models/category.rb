class Category < ApplicationRecord
    has_many :task_categories, dependent: :destroy
    has_many :tasks, through: :task_categories

    def self.ransackable_attributes(auth_object = nil)
        self.attribute_names
    end

    validates :name, presence: true
end
