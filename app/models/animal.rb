class Animal < ApplicationRecord
    belongs_to :owner
    has_and_belongs_to_many :treatments

    def dangerous
      return self.biteyness >= 3
    end
end
