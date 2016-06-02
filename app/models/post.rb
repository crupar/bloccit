class Post < ActiveRecord::Base
  has_many :comments

  after_save :filter_spam

  private
  def filter_spam
    update(title: 'spam!') if self.id % 5 == 0
  end
end
