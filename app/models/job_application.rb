class JobApplication < ApplicationRecord
    scope :offers, -> {where(status: "Offer")}
    scope :rejected, -> {where(status: "Rejected")}
    
    validates :status, :position, presence: true

    belongs_to :user
    belongs_to :company

    accepts_nested_attributes_for :company
end
