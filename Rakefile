desc "Installs scripts to ${HOME}/bin"
task :install do
  destination = File.expand_path("~/bin")
  
  FileUtils.install "battery.py", "#{destination}/battery.py", :mode => 0755
  FileUtils.install "prompt_color.py", "#{destination}/prompt_color.py", :mode => 0755
end
