require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with a first name, last name, email, matching passwords' do
      @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@gmail.com', password: 'password',
                       password_confirmation: 'password')

      expect(@user).to be_valid
    end

    describe '@first_name' do
      it 'should not be valid without a first name' do
        @user = User.new(first_name: nil, last_name: 'LName', email: 'test@gmail.com', password: 'password',
                         password_confirmation: 'password')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
    end

    describe '@last_name' do
      it 'should not be valid without a last name' do
        @user = User.new(first_name: 'FName', last_name: nil, email: 'test@gmail.com', password: 'password',
                         password_confirmation: 'password')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
    end

    describe '@email' do
      it 'should not be valid without an email' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: nil, password: 'password',
                         password_confirmation: 'password')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'should not allow a new user to enter an already registered email' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@test.ca', password: 'password',
                         password_confirmation: 'password')
        @user.save!
        @user2 = User.new(first_name: 'FName', last_name: 'LName', email: 'test@test.ca', password: 'password',
                          password_confirmation: 'password')

        expect(@user2).to_not be_valid
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
    end

    describe '@password & @password_confirmation' do
      it 'should not be valid without a password' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@gmail.com', password: nil,
                         password_confirmation: 'password')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'should not be valid without a password_confirmation' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@gmail.com', password: 'password',
                         password_confirmation: nil)

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it 'should not be valid if passwords aren\'t matching' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@gmail.com', password: 'password',
                         password_confirmation: 'passwordbutwrong')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'should not be valid if password is less than six characters' do
        @user = User.new(first_name: 'FName', last_name: 'LName', email: 'test@gmail.com', password: 'bad',
                         password_confirmation: 'bad')

        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
