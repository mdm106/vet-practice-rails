class Owner < ApplicationRecord

    def full_name
      "#{self.first_name} #{self.last_name}"
    end

    def full_address
      "#{self.address_1}, #{self.address_2}, #{self.town}, #{self.postcode}"
    end

    def format_telephone
      "#{self.telephone[0..3]} #{self.telephone[4..]}"
    end

end
