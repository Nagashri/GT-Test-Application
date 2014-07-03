class SecretCodeController < ApplicationController
	require 'securerandom'

  def new
  end

  def create
  	@num = params[:num]
  	@num.to_i.times do
  	@secret_code = SecretCode.new
  	 begin
     	@code = SecureRandom.urlsafe_base64 6
  	 end while SecretCode.exists?(:code => @code)
  	 @secret_code.code = @code
     if can? :create, @secret_code
  	   if @secret_code.save
        p "success"
  		   # redirect_to (secret_code_index_path(:notice => "Secret Codes successfully created"))
  	   else
  		   # redirect_to (secret_code_index_path(:notice => "Unsuccessfull"))
  	   end
     else
         #  redirect_to (secret_code_index_path(:notice => "You are not an admin"))
      end
  	end
  end
  #<%= f.collection_select :secret_code, SecretCode.where(['email IS NULL']),:code,:code %>

  def index
    @codes = []
    if can? :create, @codes
  	@codes = SecretCode.all
  end
  end

  def update
  end
end
