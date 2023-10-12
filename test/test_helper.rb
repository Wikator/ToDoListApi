# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    def sign_in_as_admin
      @user = users(:two)
      post user_session_url, params: { user: { email: @user.email, password: 'password' } }, as: :json
      response.headers['Authorization']
    end

    def sign_in_as_customer
      @user = users(:one)
      post user_session_url, params: { user: { email: @user.email, password: 'password' } }, as: :json
      response.headers['Authorization']
    end
  end
end
