class Tag < ActiveRecord::Base
  #acts_as_archive #to handle archiving on deletion - not working in rails3

  ##
  ## after destroying this tag...do something
  ##
  after_destroy :delete_siblings

  private
  def delete_siblings
    puts "This is a test about destroying a tag"
  end
end
