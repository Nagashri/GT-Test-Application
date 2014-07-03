class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
  	@user = User.new
  	@user.first = params[:user][:first]
  	@user.last = params[:user][:last]
  	@user.email = params[:user][:email]
  	@user.password = params[:user][:password]
  	@user.password_confirmation = params[:user][:password_confirmation]
  	@secret_code = SecretCode.find_by_code(params[:user][:secret_code])
  	@secret_code.email = params[:user][:email]
  	@user.save
  	@secret_code.save
    # add custom create logic here
  end

  def update
    super
  end
end 