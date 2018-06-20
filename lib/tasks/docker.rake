desc 'Build and push docker container'

namespace :docker do
  def repo
    'clarkbremer'
  end

  def ssh_target
    'clark@206.189.179.3'
  end

  def get_rev
    git = Git.open('.')
    git.object('HEAD').sha[0, 7]
  end

  def get_build_tag
    "creditcracker:#{get_rev}"
  end

  def tag
    "#{repo}/#{get_build_tag}"
  end

  desc 'build docker container'
  task :build do
    sh "docker build -t #{tag} ."
  end

  desc 'push docker container'
  task :push do
    sh "docker push #{tag}"
  end

  desc 'pull docker container on server'
  task :pull do
    sh "ssh #{ssh_target} 'docker pull #{tag}'"
  end

  desc 'launch docker container on server'
  task :launch do
    sh "echo \"version: '3'\nservices:\n  app:\n    image: #{tag}\" > docker-compose.override.yml"
    sh "ssh #{ssh_target} 'cd credit_cracker; docker-compose down'"
    sh "scp docker-compose.override.yml #{ssh_target}:credit_cracker/"
    sh "ssh #{ssh_target} 'cd credit_cracker; docker-compose up -d'"
  end

  desc 'build, and push docker container'
  task :publish => ["build", "push"]

  desc 'build, and push docker container'
  task :deploy => ["build", "push", "pull", "launch"]
end
