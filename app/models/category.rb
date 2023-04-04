class Category < ApplicationRecord
    validates :name, presence: true
    has_many :task_categories, dependent: :destroy
    has_many :tasks, through: :task_categories

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "name", "updated_at"]
    end
end
