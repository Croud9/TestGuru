module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Author: #{author_name}", "https://github.com/#{author_name}/#{repo_name}", target: :blank
  end
end
