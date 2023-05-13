# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postscounter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', postscounter: 0)


first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )