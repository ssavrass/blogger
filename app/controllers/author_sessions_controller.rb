class AuthorSessionsController < ApplicationController
  before_filter :zero_authors_or_authenticated, only: [:new, :create]

  def zero_authors_or_authenticated
    unless Author.count == 0 || logged_in? == false
      redirect_to root_path
      return false
    end
  end
  
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to articles_path 
      flash.notice = 'Logged in successfully.'
    else
      flash.notice = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
