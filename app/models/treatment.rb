class Treatment < ApplicationRecord
    has_and_belongs_to_many :animals

    def self.fromString(string)
      treatment = Treatment.where(name: string.strip).first
      return treatment ||= Treatment.create(["name" => string]);
    end

    def self.fromStrings(array_of_strings)
        array_of_strings.map{|string| fromString(string)}
    end
    
end
