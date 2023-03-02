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

  # Login
  post "/user/login" do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      { message: "Logged in successfully" }.to_json
    else
      { error: "Invalid email or password" }.to_json
    end
  end

  # Logout
  post "/user/logout" do
    session[:user_id] = nil
    { message: "Logout successfully" }.to_json
  end
    # Add pet
    post "/add/pet" do
        user = User.find_by(id: session[:user_id])
        if user
          pet =
            Pet.create(
              name: params[:name],
              breed: params[:breed],
              age: params[:age],
              user_id: user.id,
            )
          if pet.valid?
            { message: "Pet added successfully" }.to_json
          else
            { error: "Failed to add pet" }.to_json
          end
        else
          { error: "You must be logged in to add a pet" }.to_json
        end
      end