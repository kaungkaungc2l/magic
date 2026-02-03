# Puma configuration file for Railway

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Bind to all interfaces on the port Railway assigns
bind "tcp://0.0.0.0:#{ENV.fetch('PORT', 3000)}"

plugin :tmp_restart

# Set workers if needed (uncomment if you want multiple processes)
# workers ENV.fetch("WEB_CONCURRENCY", 2)

# Preload app for faster worker boot (if using workers)
# preload_app!

# Allow puma to be restarted by `bin/rails restart`
plugin :tmp_restart

# Solid Queue plugin if needed
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# PID file (optional)
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
