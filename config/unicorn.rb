# {project_root}/config/unicorn.rb より
rails_root = File.expand_path('../', __dir__)

worker_processes 2
working_directory rails_root

timeout 30

stderr_path "#{rails_root}/log/unicorn_stderr.log"
stdout_path "#{rails_root}/log/unicorn_stdout.log"

preload_app true

listen 3001
# listen "#{rails_root}/tmp/unicorn.sock"
pid "#{rails_root}/tmp/pids/unicorn.pid"

