class JobApplication < ApplicationRecord
    validates :status, presence: true

    belongs_to :user
    belongs_to :company

    accepts_nested_attributes_for :company
end
