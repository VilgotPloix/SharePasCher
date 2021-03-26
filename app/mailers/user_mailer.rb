class UserMailer < ApplicationMailer
	default from: "gustavevilgot@gmail.com"
    
    def welcome(user)
        
        @user = user

        @url = "sharepascher.herokuapp.com"

        mail(to: @user.email, subject: "Inscription sur le site : Share pas cher")

    end
end
