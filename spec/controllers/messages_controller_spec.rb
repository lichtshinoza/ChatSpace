# require 'rails_helper'

# describe MessagesController do
#   before do
#     get :index, params
#   end

#   describe 'GET #index' do
#     let(:message) { create(:message) }
#     let(:params) { { group_id: message.group.id } }

#     it "index test" do
#       expect(assigns(:messages)).to match([message])
#     end

#     it "renders the :index template" do
#       expect(response).to render_template :index
#     end
#   end

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


# end
