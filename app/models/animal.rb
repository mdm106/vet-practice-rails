class Animal < ApplicationRecord
    belongs_to :owner

    def dangerous
      return self.biteyness >= 3
    end
end
