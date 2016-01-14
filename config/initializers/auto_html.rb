require 'auto_html'

AutoHtml.add_filter(:image).with(:width => 360) do |text, options|

  text.gsub(/http:\/\/.+\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
    width = options[:width]
    %|<div class="image-attachment"><p><span class="text-muted">Uploaded an image:</span> "#{ match.split('/').last }"</p><img src="#{match}" alt="#{ match.split('/').last }" width="#{ width }" /></div>|
  end
+end
