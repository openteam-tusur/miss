# encoding: utf-8

Factory.sequence :contest_year do |n|
  "201#{n}"
end


Factory.define :contest, :default_strategy => :attributes_for do |contest|
  contest.year {Factory.next(:contest_year)}
  contest.voting_started_on {Date.today - 10.days}
  contest.voting_finished_on {Date.today + 10.days}
end

