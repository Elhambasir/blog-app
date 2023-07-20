# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'Teacher from Poland.')

first_user = User.find(1)
second_user = User.find(2)

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')

first_post = Post.find(1)
second_post = Post.find(2)
third_post = Post.find(3)
fourth_post = Post.find(4)

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: first_post, author: second_user, text: 'Your post is nice!')
Comment.create(post: first_post, author: first_user, text: 'Perfect')
Comment.create(post: first_post, author: first_user, text: 'I liked your post')
Comment.create(post: first_post, author: second_user, text: 'I love your post')
Comment.create(post: first_post, author: first_user, text: 'You look great!')

