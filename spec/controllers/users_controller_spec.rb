describe UsersController, :type => :controller do

  let (:user) {FactoryGirl.create(:user)}  

  describe "GET #show" do

    context 'user is logged in' do
      before 'login user' do
        sign_in user
      end
      it 'loads correct user details' do
        get :show
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
    end

    context "no user is logged in" do
      it 'redirects to login' do
        get :show, id: user.id
        expect(response).to redirect_to(users_sign_in_path)
      end
    end
  end
end