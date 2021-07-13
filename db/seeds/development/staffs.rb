Staff.create!(
  nick_name: '管理者',
  gender: 'male',
  email: 'admin_staff@example.com',
  password: 'password',
  suspended: false,
  admin: true
)

Staff.create!(
  nick_name: 'スタッフ',
  gender: 'female',
  email: 'staff@example.com',
  password: 'password',
  suspended: false,
  admin: false
)
20.times do |n|
    if n.even?
      Staff.create!(
        nick_name: "スタッフ#{n}",
        gender: 'male',
        email: "staff#{n}@example.com",
        password: 'password'
      )
    else
      Staff.create!(
        nick_name: "スタッフ#{n}",
        gender: 'female',
        email: "staff#{n}@example.com",
        password: 'password'
      )
    end
end