# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user_list = [
	[ id: 20, fname: "jimmy", lname: "jimmy", email: "jimmy@jimmy.com", password: "jimmy", goals: nil, location: nil, user_name: nil, created_at: "2014-12-11 21:53:33", updated_at: "2014-12-12 21:56:33", avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 2054, avatar_updated_at: "2014-12-12 21:56:32", staff_or_student: "student"]
	[ id: 2, fname: "John", lname: "John", email: "john@john.com", password_digest: "john", goals: nil, location: nil, user_name: nil, created_at: "2014-12-08 16:33:58", updated_at: "2014-12-11 15:44:17", avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 2054, avatar_updated_at: "2014-12-11 15:28:48", staff_or_student: "student"]
	[ id: 4, fname: "Jim", lname: "Jim", email: "jim@jim.com", password_digest: "jim", goals: nil, location: nil, user_name: nil, created_at: "2014-12-08 19:11:36", updated_at: "2014-12-11 15:44:34", avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg", avatar_file_size: 2054, avatar_updated_at: "2014-12-11 15:33:14", staff_or_student: "student"]

]

user_list.each do | id, fname, lname, email, password,
	goals, location, user_name, created_at, updated_at,
	avatar_file_name, avatar_content_type, avatar_file_size,
	avatar_updated_at, staff_or_student|
		User.create(id: id, fname: fname, lname: lname, email: email, password: password,
			goals: goals, location: location, user_name: user_name, created_at: created_at, updated_at: updated_at,
			avatar_file_name: avatar_file_name, avatar_content_type: avatar_content_type, avatar_file_size: avatar_file_size,
			avatar_updated_at: avatar_updated_at, staff_or_student: staff_or_student)
end


post_list = [
	[ id: 8, user_id: 20, text: "Wanted to contact you all about a great site.", created_at: "2014-12-12 22:27:16", updated_at: "2014-12-12 22:27:16", title: "This is a new post"]
]

post_list.each do | id, user_id, text, created_at, updated_at, title |
		Post.create(id: id, user_id: user_id, text: text, created_at: created_at, 
			updated_at: updated_at, title: title)
end


community_list = [
	[id: 6, title: "Yet another Community Post. How do I alphabetize?", text: "Trouble with alphabetizing lowercase words with up...", created_at: "2014-12-11 18:42:01", updated_at: "2014-12-11 18:44:07", user_id: 4]
]

community_list.each do | id, title, text, created_at, updated_at, user_id |
		Community.create(id: id, title: title, text: text, created_at: created_at, 
			updated_at: updated_at, user_id: user_id)
end


comment_list = [

]

comment_list.each do | id, text, created_at, updated_at, user_id |
		Comment.create(id: id, text: text, created_at: created_at, 
			updated_at: updated_at, user_id: user_id)
end
