# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.1.5"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.1.5.tar.gz"
    sha256 "855f5af68984dde26a2ab51c85dfba21e5e00ad7c11169ed29b98de551dc30ba"
    license "GPL-3.0-only"
  
    depends_on "deno"
  
    def install
      # Loop over each matching filename
      Dir["src/*.ts"].each do |file|
        # Extract the base filename (e.g., "authorize.channel.ts")
        base_name = File.basename(file)
        # Prepend "384." to the base filename (e.g., "384.authorize.channel.ts")
        new_name = "384." + base_name
        # Install the file under the new name
        bin.install file => new_name
      end
    
        # Ensure scripts have executable permissions
        chmod 0755, Dir["#{bin}/*.ts"]
      end

      # Also install the convenience script, which doesn't have a suffix
      bin.install "src/os384"
      chmod 0755, "#{bin}/os384"

    def uninstall
      # Loop over each matching filename
      Dir["src/*.ts"].each do |file|
        # Extract the base filename (e.g., "authorize.channel.ts")
        base_name = File.basename(file)
        # Prepend "384." to the base filename (e.g., "384.authorize.channel.ts")
        new_name = "384." + base_name
        # Remove the installed file
        rm_f bin/new_name
      end

      # Also remove the convenience script, which doesn't have a suffix
      rm_f bin/os384
  
    #test do
    #  # Replace 'script1' and the expected output as per your script's functionality
    #  output = shell_output("#{bin}/script1 --version")
    #  assert_match "0.1.5", output
    #end
  end
  
