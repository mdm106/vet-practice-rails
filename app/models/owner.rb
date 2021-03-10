class Owner < ApplicationRecord
    belongs_to :user

    validates :first_name, :last_name, presence: true

    def full_name
      "#{self.first_name} #{self.last_name}"
    end

    def full_address
      "#{self.address_1}, #{self.address_2 != "" ? self.address_2 + ',' : '' } #{self.town}, #{self.postcode}"
    end

    def format_telephone
      "#{self.telephone[0..3]} #{self.telephone[4..]}"
    end

    def haveWeBananas(number)
      if(number == 0)
        return "No we have no bananas"
      end

      return "Yes we have #{number} bananas"
    end

    def email_exists(email)
      return Owner.where(:email => email).count >= 1
    end

end
