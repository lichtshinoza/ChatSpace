require 'rails_helper'

describe MessagesController do
  # let(:params) { { group_id: message.group.id } }

  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:messages) { create_list(:message, 5, user_id: user.id, group_id: group.id) }
  let(:params) { {group_id: group.id} }

  describe 'GET #index, user_login ' do
    before do
      login_user user
      get :index, params
    end
      it "@message is comfirmed, as empty" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "@group is comfirmed, @group is extracted by Group table " do
        expect(assigns(:group)).to match(group)
      end

      it "index template is rendered" do
        expect(response).to render_template :index
      end
  end

  describe 'GET #index, user_is_not_login' do
    before do
      get :index, params
    end

      it "user should login first" do
        expect(response).to redirect_to(new_user_session_path)
      end
  end

  describe 'POST #create, user_login' do
    before do
      login_user user
      post :create, group_id: group, message: attributes_for(:message)
    end

      it "valid new message can be saved" do
        expect{post :create, group_id: group, message: attributes_for(:message)}.to change(Message, :count).by(1)
      end

      it "when message is valid, redirect_to(group_messages_path)" do
        expect(response).to redirect_to(group_messages_path)
      end

      it "invalid new message can't be saved" do
        expect{post :create, group_id: group, message: attributes_for(:message, msg: nil, image: nil)}.not_to change(Message, :count)
      end

      it "when message is invalid, redirect_to(group_messages_path)" do
        expect(response).to redirect_to(group_messages_path)
      end
  end

  describe 'POST #create, user_is_not_login' do
    before do
      post :create, group_id: group, message: attributes_for(:message)
    end

      it "past message is impossible wheh user_login, redirect to sign_in" do
        expect(response).to redirect_to(new_user_session_path)
      end
  end

#   describe 'POST #create, msg is existing' do
#     let(:message) { create(:message, image: "") }
#     let(:params) { { group_id: message.group.id } }

#     it "posting message is clear" do
#       expect(message).to be_valid
#     end

#     it "renders the :create template" do
#       expect(response).to render_template :index
#     end
#   end

#  describe 'POST #create image is existing' do
#     let(:message) { create(:message, msg: "") }
#     let(:params) { { group_id: message.group.id } }

#     it "posting message is clear" do
#       expect(message).to be_valid
#     end

#     it "renders the :create template" do
#       expect(response).to render_template :index
#     end
#   end
#  describe 'POST #create msg & image is existing' do
#     let(:message) { create(:message) }
#     let(:params) { { group_id: message.group.id } }

#     it "posting message is clear" do
#       expect(message).to be_valid
#     end

#     it "renders the :create template" do
#       expect(response).to render_template :index
#     end
#   end

# //

#   describe 'POST #create, msg & image is not existing' do
#     let(:message) { build(:message, msg: nil,image: nil) }
#     let(:params) { { group_id: message.group.id } }

#     it "1 posting message is clear" do
#       message.valid?
#       expect(message.errors[:msg]).to include("を入力してください")
#     end

#     it "2 renders the :create template" do
#       expect(response).to render_template :index
#     end
#   end


end
