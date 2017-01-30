class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_commetn(comment)
    CommetnsController.render partial: 'comments/comment', locals: { comment: comment }
  end
end
