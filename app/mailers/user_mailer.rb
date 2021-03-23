class UserMailer < ApplicationMailer
	default from: "gustavevilgot@gmail.com"
    
    def welcome(user)
        
        @user = user    

        @url = "sharepascher.herokuapp.com"

        mail(to: @user.email, subject: "Coucou")

    end
end
