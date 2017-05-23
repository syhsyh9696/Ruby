# encoding utf-8

require 'redlock'

# Locking
lock_manager = Redlock::Client.new(["redis://127.0.0.1:6379"])
first_try_lock_info = lock_manager.lock("resource_key", 1000)
second_try_lock_info = lock_manager.lock("resource_key", 2000)

p first_try_lock_info
p second_try_lock_info
