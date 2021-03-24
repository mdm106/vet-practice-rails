class Animal < ApplicationRecord
    belongs_to :owner
    has_and_belongs_to_many :treatments

    def dangerous
      return self.biteyness >= 3
    end

    def addTreatments(array_of_strings)
      treatments = Treatment.fromStrings(array_of_strings)

      self.treatments << treatments.flatten
      self.save!
    end
end
