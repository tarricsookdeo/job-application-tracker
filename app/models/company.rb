class Company < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { minimum: 4 }
    
    has_many :job_applications
    has_many :users, :through => :job_applications
end
