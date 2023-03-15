class Task < ApplicationRecord
    validates :name, presence: true
    validates :deadline, presence: true
    validates :priority, presence: true
    validates :status, presence: true

    enum status: {
        yet: 0,
        ongoing: 1,
        done: 2
    }
end
