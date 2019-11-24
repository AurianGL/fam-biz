require 'rails_helper'

RSpec.describe AuthenticateUser do
   # create test user
   let(:user) { create(:user) }
   # valid request subject
   subject(:valid_auth_obj) { described_class.new(user.email, user.password) }
   # invalid request subject
   subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

   describe '#call' do
     context 'when valid credentials' do
       it 'returns an auth token' do
         token = valid_auth_obj.call
         expect(token).not_to be_nil
       end
     end

     context "raises an authentication error" do
      it "raises an authentucation error" do
        expect { invalid_auth_obj.call }  
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            /Invalid credentials/
          )
      end
    end
  end
end