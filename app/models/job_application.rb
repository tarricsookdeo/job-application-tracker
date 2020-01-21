class JobApplication < ApplicationRecord
    scope :by_company, -> (id) {where("company_id == ?", id)}
    
    validates :status, :position, presence: true

    belongs_to :user
    belongs_to :company

    def company_attributes=(company_hash)
        self.company = Company.find_or_create_by(company_hash)
    end
end
