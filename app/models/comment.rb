class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  def is_exchange_proposal?
    content.present? && (content.include?("交換OKです。提示いただいたページで交換作業を行います。") || content.include?("交換作業を行なっていただきありがとうございます。こちらも交換作業を行います。"))
  end

end
