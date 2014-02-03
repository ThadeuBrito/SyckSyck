# encoding: utf-8
module ApplicationHelper
  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end

  def sim_nao(valor)
    valor ? 'Sim' : 'Não'
  end

  def para_link(link)
    pos1 = link.split(':')[0]
    return (pos1 == 'http' ? link : 'http://' + link)
  end

  def real(valor)
    valor && valor > 0 ? number_to_currency(valor) : 'Grátis'
  end

end
