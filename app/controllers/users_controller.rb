class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new(params[:user])
    @user.role = Role.first(:conditions => ['name = ?', 'user'])

    User.transaction do
      respond_to do |format|
        if @user.save
          Notifier.confirm_email(@user).deliver
          format.html {redirect_to(main_url, :notice => "Your are registered. Confirm your email.")}
        else
          format.html { render :action => 'new' }
        end
      end
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  def show
  end

  def confirm_email
    begin
      user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Proba aktywacji uzytkownika o nieprawidlowym id #{params[:user_id]}"
      flash[:error] = 'Activation failed'
    else
      if user.activation_key != params[:activation_key]
        logger.error "Proba aktywacji uzytkownika o id #{params[:user_id]} nieprawidlowym kluczem = #{params[:activation_key]}"
        flash[:error] = 'Activation failed'
      else
        user.state = User::STATE_ACTIVE
        user.save
        flash[:notice] = 'Your acount is active. You can log in.'
      end
    end

    redirect_to main_url
  end

end
