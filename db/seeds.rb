# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# tom = User.create(name: 'Tom', photo: 'https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=', bio: 'I am a teacher with a passion for teaching and learning. I have been teaching for over 10 years, and I have seen the power of education to transform lives. I am committed to providing my students with the tools they need to succeed in school and in life. I am also a strong advocate for equity and access to education.', posts_counter: 0)
# lilly = User.create(name: 'Lilly', photo: 'https://www.istockphoto.com/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-gm1437816897-478501891?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&utm_term=profile%3A%3A%3A', bio: 'I am a businessman with a passion for building successful businesses. I have started and run several businesses over the years, and I have learned a lot about what it takes to be successful in business. I am committed to creating businesses that make a positive impact on the world. I am also a strong advocate for social responsibility in business.', posts_counter: 0)
# john = User.create(name: 'John', photo: 'https://media.istockphoto.com/id/1400618001/photo/profile-headshot-portrait-of-a-handsome-smiling-african-american-man-with-beard-and-mustache.webp?b=1&s=170667a&w=0&k=20&c=hvLszdWnBkWp0jC6cmyroGuxuDuHGrmJY8qK_cv5NAw=', bio: 'I am a software engineer with over 10 years of experience in the industry. I am passionate about building innovative software products that solve real-world problems. I have a strong track record of delivering high-quality software on time and within budget. I am also a team player and I enjoy working with others to achieve common goals.', posts_counter: 0)

# anna = User.create(name: 'Anna', photo: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60', bio: 'I am a writer with a passion for storytelling. I have written for a variety of publications, including newspapers, magazines, and websites. I am also the author of two novels. I am interested in writing about a variety of topics, including culture, politics, and social justice. I am also a strong advocate for diversity and inclusion in the media.', posts_counter: 0)
# bob = User.create(name: 'Bob', photo: 'https://images.unsplash.com/photo-1466112928291-0903b80a9466?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60', bio: 'I am a doctor with a passion for helping people. I have been practicing medicine for over 20 years, and I have seen firsthand the impact that good healthcare can have on people\'s lives. I am committed to providing my patients with the highest quality care possible. I am also a strong advocate for patient education and empowerment.', posts_counter:0)

tom_post = Post.create(author: tom, title: 'A personal post', text: 'I just finished reading "The Alchemist" by Paulo Coelho, and I absolutely loved it! It\'s such a beautiful and inspiring story about following your dreams. I highly recommend it to anyone who is looking for a little bit of inspiration in their lives.', comments_counter: 0, likes_counter: 0)
lilly_post = Post.create(author: lilly, title: 'A professional post', text: 'I\'m excited to announce that I\'ve just started a new job as a software engineer at Google! I\'m really looking forward to working on some challenging and interesting projects. I\'m also excited to be a part of such a talented and innovative team.', comments_counter: 0, likes_counter: 0)
john_post = Post.create(author: john, title: 'A humorous post', text: 'I just saw a dog wearing a hat today. I don\'t know why, but it made me laugh so hard. I guess it\'s just the image of a dog in a hat that\'s so funny to me.', comments_counter: 0, likes_counter: 0)
anna_post = Post.create(author: anna, title: 'A thought-provoking post', text: 'I\'ve been thinking a lot about the meaning of life lately. I\'m not sure if there\'s a grand answer, but I think it\'s important to live each day to the fullest and to make a difference in the world.', comments_counter: 0, likes_counter: 0)
bob_post = Post.create(author: bob, title: 'A call to action post', text: 'I\'m starting a new campaign to raise awareness about the importance of education. I believe that everyone deserves access to a quality education, regardless of their background. If you\'re interested in getting involved, please visit my website.', comments_counter: 0, likes_counter: 0)

Comment.create(post: tom_post, author: lilly, text: '"The Alchemist" is a great read! #inspiration')
Comment.create(post: lilly_post, author: tom, text: 'Congrats on the new job! #softwareengineer #google')
Comment.create(post: john_post, author: tom, text: 'Dog in a hat = lol #funny')
Comment.create(post: anna_post, author: bob, text: 'What is the meaning of life? #pondering')
Comment.create(post: bob_post, author: anna, text: 'Education is important! #getinvolved')
Comment.create(post: tom_post, author: john, text: 'You look great!')
Comment.create(post: lilly_post, author: anna, text: 'I love your outfit!')
Comment.create(post: john_post, author: bob, text: 'I\'m so proud of you!')
Comment.create(post: anna_post, author: lilly, text: 'You\'re an inspiration!')
Comment.create(post: bob_post, author: tom, text: 'I\'m so excited for you!')
Comment.create(post: tom_post, author: bob, text: 'I\'m so happy for you!')
Comment.create(post: lilly_post, author: john, text: 'I\'m so proud of you!')
Comment.create(post: john_post, author: anna, text: 'I\'m so excited for you!')
Comment.create(post: anna_post, author: bob, text: 'I\'m so happy for you!')
Comment.create(post: bob_post, author: tom, text: 'I\'m so proud of you!')
Comment.create(post: tom_post, author: lilly, text: 'I\'m so excited for you!')
Comment.create(post: lilly_post, author: john, text: 'I\'m so happy for you!')
Comment.create(post: john_post, author: anna, text: 'I\'m so proud of you!')
Comment.create(post: anna_post, author: bob, text: 'I\'m so excited for you!')
Comment.create(post: bob_post, author: tom, text: 'I\'m so happy for you!')
Comment.create(post: tom_post, author: lilly, text: 'I\'m so proud of you!')
Comment.create(post: lilly_post, author: john, text: 'I\'m so excited for you!')
Comment.create(post: john_post, author: anna, text: 'I\'m so happy for you!')
Comment.create(post: anna_post, author: bob, text: 'I\'m so proud of you!')
Comment.create(post: bob_post, author: tom, text: 'I\'m so excited for you!')
Comment.create(post: tom_post, author: lilly, text: 'I\'m so happy for you')

# anna = User.find_by(name: 'Anna')
# tom = User.find_by(name: 'Tom')
# anna_post1 = Post.create(author: anna, title: 'A good party', text: 'Last week we had a good party together!', comments_counter: 0, likes_counter: 0)
# anna_post2 = Post.create(author: anna, title: 'A good day', text: 'I have never had such a good day', comments_counter: 0, likes_counter: 0)
# Comment.create(post: anna_post1, author: tom, text: 'I\'m so happy for you!')
# Comment.create(post: anna_post2, author: tom, text: 'I\'m so proud of you!')

