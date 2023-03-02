class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"
    enable :sessions

     # Add user
  post "/user/register" do
    begin
      user =
        User.create(
          name: params[:name],
          email: params[:email],
          location: params[:location],
          password: params[:password],
          password_confirmation: params[:password_confirmation],
        )
      if user.valid?
        session[:user_id] = user.id
        { message: "User created successfully" }.to_json
      else
        { error: user.errors.full_messages }.to_json
      end
    rescue ActiveRecord::RecordNotUnique => e
      { error: "Email address already registered" }.to_json
    rescue ActiveRecord::RecordInvalid => e
      { error: e.record.errors.full_messages.join(", ") }.to_json
    rescue => e
      { error: "Regestration failed" }.to_json
    end
  end