class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :company

    accepts_nested_attributes_for :company
end
