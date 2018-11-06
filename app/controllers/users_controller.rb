class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create nom:params[:user][:nom], prenom:params[:user][:prenom], email:params[:user][:email], password:params[:user][:password]
    if @user.save
      redirect_to '/login'
    else
      @titre = "Inscription"
      render 'new'
    end

    def index
    	@user = User.all
    end

    def show
  		@user = User.all
  	end

  	def edit
  		@user = User.find(params[:id])
  	end

	def update
  		@user = User.find(params[:id])
  		post_new = params.require(:user).permit(:prenom, :nom, :email, :password)
  		@user.update(post_new)
  		redirect_to "/gossips"
	end
end
end