class Owner < ApplicationRecord

    def fullName
        "#{first_name} #{last_name}"
    end

    def fullAddress
        "#{address_1}, #{address_2}, #{town}, #{postcode}"
    end

    def formattedTelephone
        telephone.insert(4, '-').insert(-5, '-')
    end

end
