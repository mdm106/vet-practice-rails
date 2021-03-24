class WelcomeController < ApplicationController

    def index
        t = Time.now()
        currentHour = t.hour
        @greeting = "";
        if currentHour < 12
            @greeting="Good Morning";
        elsif currentHour < 17
            @greeting="Good Afternoon";
        elsif currentHour < 22
            @greeting="Good Evening";
        else
            @greeting="Good Night";
        end

        if logged_in?
            @greeting = @greeting + ", " + current_user.name
        end
        
    end

end
