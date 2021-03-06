class MakersBnb < Sinatra::Base
  get "/" do
    if current_user
      redirect to("/spaces")
    end
    erb :"sessions/new"

  end

  post "/sessions" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id]= user.id
      redirect to("/spaces")
    else
      flash.now[:errors] = "The email or password is incorrect"
      erb :"sessions/new"
    end
  end

  get "/sessions/new" do
    if current_user
      redirect to("/spaces")
    end
    erb :"sessions/new"
  end

  delete "/sessions" do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to "/"
  end
end
