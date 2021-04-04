FactoryBot.define do
  factory :task, class: Task do
    title { Faker::Hacker.say_something_smart }
    description { Faker::Hacker.adjective  }
    time { Faker::Number.number(digits: 3) }
  end
end
