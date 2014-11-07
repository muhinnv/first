# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Создаем пользователя
user = User.create(login: 'test_user_1', first_name: 'first_name_1', last_name: 'last_name_1')

# Создаем посты, относящиеся к созданному пользователю
user.posts.create(title: 'first_user_post_1', body: 'first_user_post_1_body')
user.posts.create(title: 'first_user_post_2', body: 'first_user_post_2_body')
user.posts.create(title: 'first_user_post_3', body: 'first_user_post_3_body')

# Создаем комментарии от созданного пользователя, относящиеся к созданным постам
user.posts.each do |post|
	5.times do |i|
		post.comments.create(title: "Title #{i+1}", message: "Message #{(i+1)*(i+1)}")
	end
end