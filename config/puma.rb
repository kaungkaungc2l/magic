# Puma configuration file for Railway

# Threads
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Bind to all interfaces on the port Railway assigns
port ENV.fetch("PORT") { 3000 }
bind "tcp://0.0.0.0:#{ENV.fetch('PORT') { 3000 }}"

# Workers (for clustered mode, uncomment if needed)
# workers ENV.fetch("WEB_CONCURRENCY", 2)
# preload_app! if workers > 1

# Allow puma to be restarted by `bin/rails restart`
plugin :tmp_restart

# Solid Queue plugin if needed
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# PID file (optional)
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Environment
environment ENV.fetch("RAILS_ENV") { "production" }

# Logging (important for Railway logs)
stdout_redirect "log/puma.stdout.log", "log/puma.stderr.log", true
