module ApplicationHelper
  def document_title
    if @title.present?
      @title.to_s
    else
      'Toiletter'
    end
  end
end
