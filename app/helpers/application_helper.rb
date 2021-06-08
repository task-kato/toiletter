module ApplicationHelper
    def document_title 
        if @title.present? 
            "#{@title}"
        else
            "Toiletter"
        end
    end
end
