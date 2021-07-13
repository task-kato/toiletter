class Staff::Authenticator

  def initialize(staff)
    @staff = staff
  end

  def authenticate(raw_password)
    @staff &&
      !@staff.suspended? &&
      @staff.hashed_password &&
      BCrypt::Password.new(@staff.hashed_password) == raw_password
  end

end
