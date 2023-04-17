class Task < ApplicationRecord
    has_many :task_categories
    has_many :categories, through: :task_categories
    validates :name, presence: true
    validates :deadline, presence: true
    validates :priority, presence: true
    validates :status, presence: true

    enum status: {
        not_started: 0, # 未着手
        in_progress: 1, # 着手中
        completed: 2    # 完了
    }
    def disp_name
        "#{name}です"
    end
end
