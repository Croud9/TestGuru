module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author_name, repo_name)
    link_to "Author: #{author_name}", "https://github.com/#{author_name}/#{repo_name}", target: :blank
  end

  def flash_message(key)
    if flash[key]
      content_tag :p, flash[key], class: 'flash message'
    end
  end

  def gist_hash(gist)
    gist.gist_url.split('/').last
  end
end
