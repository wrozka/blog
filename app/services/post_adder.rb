module PostAdder
  def self.add(details)
    Post.create!(title: details[:title],
                 author: details[:author],
                 content: details[:content])
  end
end
