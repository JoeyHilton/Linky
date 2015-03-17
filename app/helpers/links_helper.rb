module LinksHelper

  def vote_badge(link)
    if link.votes >= 0
      content_tag :span, link.votes, class: ['label','label-info'] 
    else  
      content_tag :span, link.votes, class: ['label','label-warning'] 
    end  
  end
end
