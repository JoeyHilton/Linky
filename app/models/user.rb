class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def profile
    @user = current_user
  end
end
