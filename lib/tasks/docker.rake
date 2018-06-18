desc 'Build and push docker container'

namespace :docker do
  def repo
    'clarkbremer'
  end

  def get_rev
    git = Git.open('.')
    git.object('HEAD').sha[0, 7]
  end

  def get_build_tag
    "creditcracker:#{get_rev}"
  end

  desc 'build docker container'
  task :build do
    sh "docker build -t #{get_build_tag} ."
  end

  desc 'push docker container'
  task :push do
    sh "docker push #{repo}/#{get_build_tag}"
  end

  desc 'build, tag, and push docker container'
  task :publish => ["build", "push"]
end
