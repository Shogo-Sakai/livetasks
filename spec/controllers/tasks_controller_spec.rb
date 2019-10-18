require "rails_helper" 

describe TasksController do
  before do
    @user = create(:user)
    sign_in @user
    @live = create(:live, user_ids: @user.id)
    session[:live_id] = @live.id
  end

  context "GET #index" do
    it "render to index page" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of tasks" do
      tasks = create_list(:task, 5, user_id: @user.id, live_id: @live.id)
      get :index
      expect(assigns(:tasks)).to match(tasks)
    end
  end

  context "GET #new" do
  it "render to new page" do
      get :new
      expect(response).to render_template :new
    end
  end

  context "POST #create" do
    it "is redirected to task index page with content" do
      post :create, params: {task:{content:"test_content", user_id: @user.id, live_id: @live.id}}
      expect(response).to redirect_to "/users/#{@user.id}/lives/#{@live.id}/#tasks"
    end
    it "is rendered to new page if failed" do
      post :create, params: {task:{content:"test_content"}}
      expect(response).to render_template :new
    end
  end

  context "GET #edit" do
    it "render to edit page" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      get :edit, params: {id: task.id}
      expect(response).to render_template :edit
    end
  end
  context "PATCH #upate" do
    it "is redirected to task index page" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      patch :update, params: {id: task.id, task:{content:"update_content"}}
      expect(response).to redirect_to "/users/#{@user.id}/lives/#{@live.id}/#tasks"
    end
    it "rendered to edit page when failed" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      patch :update, params: {id: task.id, task:{content:""}}
      expect(response).to render_template :edit
    end
  end
  context "DELETE #destroy" do
    it "is redirected to task index page when successed" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      delete :destroy, params:{id: task.id}
      expect(response).to redirect_to "/users/#{@user.id}/lives/#{@live.id}/#tasks"
    end
    it "is deleted from database" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      delete :destroy, params:{id: task.id}
      expect(Task.count).to eq 0
    end
  end
  
  context "GET show" do 
    it "is rendered to show page" do
      task = create(:task, user_id: @user.id, live_id: @live.id)
      get :show, params:{id: task.id}
      expect(response).to render_template :show
    end
  end

end
