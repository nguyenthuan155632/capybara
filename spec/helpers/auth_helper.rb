module AuthHelper
  def login_and_logout_with_warden
    Warden.test_mode!
    user = User.create(email: FFaker::Internet.email, password: '123456')
    login_as(user, scope: :user)
    yield
    logout(:user)
    Warden.test_reset!
  end
end