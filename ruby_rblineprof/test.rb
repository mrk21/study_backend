require 'bundler'
Bundler.require

target = /./
profile = lineprof(target) do
  sleep 0.1
end

LineProf.report(profile)
