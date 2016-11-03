class Render < Redcarpet::Render::HTML
  def setDocument(document)
     @document = document
  end
  def image(link, title, alt_text)
    if not link.start_with?("http", "https")
      splittedLink = @document.link.split("/")
      link = splittedLink.take(splittedLink.size - 1).join("/") + "/" + link
    end
    %(<img src="#{link}" title="#{title}" alt="#{alt_text}" />)
  end
end

