class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  def is_exchange_proposal?
    content.present? && content.include?("交換を希望しています。こちらのアイテムと交換いただくことは可能でしょうか。")
  end

end
