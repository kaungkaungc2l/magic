class Project < ApplicationRecord
    has_many :tasks, dependent: :destroy

    validates :project_name, :description, presence: true
end
