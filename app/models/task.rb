class Task < ApplicationRecord
    validates :name, presence: true
    has_many :task_categories
    has_many :categories, through: :task_categories
    # validates :deadline, presence: true
    # validates :priority, presence: true
    # validates :status, presence: true

    # enum status: {
    #     yet: 0,
    #     ongoing: 1,
    #     done: 2
    # }
    def disp_name
        "#{name}です"
    end
end
