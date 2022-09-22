
Given("the following user params:") do |params|
  email, password, confirmed_at = params.rows_hash.values_at(:email, :password, :confirmed_at)
  @user = User.new(email: email, password: password, confirmed_at: confirmed_at)
end

Then("I save user") do
  @user.save
end

Given("the following post params:") do |params|
  title, body, user_id = params.rows_hash.values_at(:title, :body, :user_id)
  @post = Post.new(title: title, body: body, user_id: user_id)
end

When("I save post") do
  @post.save
end

Then("I should have the following posts:") do |params|  
  title, body = params.rows_hash.values_at(:title, :body)
  @posts = Post.where("title LIKE ? AND body LIKE ?", "%#{title}%", "%#{body}%")
  @posts.each do |post|
    printf("| title | #{post.title} |")
    puts
    printf("| body  | #{post.body}  |")
  end
end

