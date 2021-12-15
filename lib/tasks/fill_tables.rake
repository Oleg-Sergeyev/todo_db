# frozen_string_literal: true

namespace :tables do
  desc 'Fill data into tables'
  task fill_tables: :environment do
    [Item, Event, User, Role].map(&:delete_all)
    # filling roles
    File.open("#{PATH_LIB}/roles.txt").each_line do |row|
      arr = row.split(';').map(&:chomp)
      role = Role.new name: arr.first, code: arr.last
      role.save if role.valid? == true
    end
    roles = ActiveRecord::Base.connection.exec_query('SELECT id FROM roles')
    # filling users
    File.open("#{PATH_LIB}/emails.txt").each_line do |row|
      user = User.new name: row.split('@').first,
                      email: row.chomp,
                      active: true,
                      role_id: roles.rows.sample.first
      user.save if user.valid? == true
    end
    users = ActiveRecord::Base.connection.exec_query('SELECT id FROM users')
    # filling events
    File.open("#{PATH_LIB}/events.txt").each_line do |row|
      arr = row.split(';').map(&:chomp)
      event = Event.new name: arr.first,
                        content: arr.last,
                        done: false,
                        user_id: users.rows.sample.first
      event.save if event.valid? == true
    end
    # filling items
    events = ActiveRecord::Base.connection.exec_query('SELECT * FROM events')
    File.open("#{PATH_LIB}/items.txt").each_line do |row|
      events.each do |arr|
        next unless arr.values.second.split('.').first == row.split('.').first

        @ev_id = arr.values.first
        break
      end
      item = Item.new name: row.chomp,
                      done: false,
                      event_id: @ev_id
      item.save if item.valid? == true
    end
  end
end
