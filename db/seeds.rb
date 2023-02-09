# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

second_user = User.create(name: 'Gustavo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Master of the universe.')

Post.create(author_id: second_user.id, title: 'Hello', text: 'This is my first post')
first_post2 = Post.create(author_id: second_user.id, title: 'Hello', text: 'This is my first post')

Comment.create(post_id: first_post2.id, author_id: second_user.id, text: 'Hi Tom!' )
Comment.create(post_id: first_post2.id, author_id: second_user.id, text: 'Hi Tom!' )


second_post2 = Post.create(author_id: second_user.id, title: 'Hallo', text: 'This is my second post')
third_post2 = Post.create(author_id: second_user.id, title: 'Tschuss', text: 'This is my third post')
fourth_post2 = Post.create(author_id: second_user.id, title: 'Gesundheit', text: 'This is my fourth post')
fifth_post2 = Post.create(author_id: second_user.id, title: 'Auf Wiedersen', text: 'This is my fifth post')


Comment.create(post_id: first_post2.id, author_id: second_user.id, text: 'Hi Lilly!!!!!!!!!' )

