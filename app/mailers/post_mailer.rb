class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: @post.user.email, subject: "新しく写真を投稿しました。"
  end
end

