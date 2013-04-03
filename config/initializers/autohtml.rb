AutoHtml.add_filter(:image) do |text|
  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    %|<a target="_blank" href="#{match}"><img src="#{match}" alt=""/></a>|
  end
end
