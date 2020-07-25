require 'rails_helper'

RSpec.describe "Users" do
  it "creates a user and redirects to the user's page" do
    get '/users/signup'

    expect(response).to render_template(:new)

    post_params = {
      params: {
        user: {
          name: 'Goce',
          email: 'goce_nov@yahoo.com',
          password: 'goce123',
          password_confirmation: 'goce123'
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).not_to be_nil
    expect(response).to redirect_to(assigns(:user))

    follow_redirect!
    expect(response).to render_template(:show)

    expect(response.body).to include("Goce")
    expect(response.body).to include("goce_nov@yahoo.com")
  end

  it "render New when user params are empty" do
    get '/users/signup'

    post_params = {
      params: {
        user: {
          name: '',
          email: '',
          password: '',
          password_confirmation: ''
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).to be_nil
    expect(response).to render_template(:new)
  end
end
