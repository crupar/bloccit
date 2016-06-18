class FavoriteMailer < ApplicationMailer
  default from: "crupar@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@serene-woodland-18324.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@serene-woodland-18324.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@serene-woodland-18324.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@serene-woodland-18324.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@serene-woodland-18324.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@serene-woodland-18324.herokuapp.com>"

    @post = post

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
