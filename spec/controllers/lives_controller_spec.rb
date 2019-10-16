require "rails_helper"

describe LivesController do

  before do 
    @user = create(:user)
    sign_in @user
    @live = create(:live, user_ids: @user.id)
    @task = create(:task, user_id: @user.id, live_id: @live.id)
  end

  context "GET #index" do
    it "render to index page" do
      get :index, params: {user_id: @user.id}
      expect(response).to render_template :index
    end
  end

  context "POST #create" do
    it "is redirected to show page with name" do
      live = create(:live)
      post :create, params: {user_id: @user.id, live: {name: "test_live_name"}}
      expect(response).to redirect_to user_life_path(user_id: @user.id, id: (live.id + 1))
    end
    it "is rendered to new page without name" do 
      post :create, params: {user_id: @user.id, live: {name: ""}}
      expect(response).to render_template :new
    end
  end

  context "GET #edit" do
    it "render to edit page" do
      get :edit, params: {user_id: @user.id, id: @live.id}
      expect(response).to render_template :edit
    end

    it "assigns the requested live to @live" do
      get :edit, params: {user_id: @user.id, id: @live.id}
      expect(assigns(:live)).to eq @live
    end

  end

  context "PATCH #update" do
    it "is redirected to show page with name" do
      patch :update, params:{id: @live.id, user_id: @user.id, live:{name:"updated name"}}
      expect(response).to redirect_to user_life_path(user_id: @user.id, id: @live.id)
    end
    it "is invalid without name" do
      patch :update, params:{id: @live.id, user_id: @user.id, live:{name:""}}
      expect(response).to render_template :edit
    end
  end

  context "DELETE #destroy" do
    
    it "is redirected when live is deleted" do
      delete :destroy, params:{id: @live.id, user_id: @user.id}
      expect(response).to redirect_to user_lives_path(user_id: @user.id)
    end

    it "is deleted from database" do
      lives = create_list(:live, 5)
      delete :destroy, params: {id:@live.id, user_id: @user.id}
      expect(Live.count).to eq 5
    end
  end

  context "GET #show" do
    it "is redirected to live show page" do
      get :show, params: {id: @live.id, user_id: @user.id}
      expect(response).to render_template :show
    end
  end


end
