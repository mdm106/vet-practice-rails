class WelcomeController < ApplicationController

    def index
      @owners = Owner.all
    end

end
