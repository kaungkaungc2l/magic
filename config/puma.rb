# Puma configuration for Railway

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Bind to Railway's dynamic port
port ENV.fetch("PORT") { 3000 }

# Workers (optional)
# workers ENV.fetch("WEB_CONCURRENCY", 2)
# preload_app!

plugin :tmp_restart
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# PID file (optional)
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
