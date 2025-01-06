# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.2.5"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.2.5.tar.gz"
    sha256 "914fc3c667d476e437e646673c6a4a9eb9027adcb09f9da3c196eb37cb478d46"
    license "GPL-3.0-only"
  
    depends_on "deno"
  
    def install
      # Directly install executable .ts scripts into bin
      bin.install Dir["src/*.ts"]
    
      # Ensure scripts have executable permissions
      chmod 0755, Dir["#{bin}/*.ts"]

      # Also install the convenience script, which doesn't have a suffix
      bin.install "src/384"
      chmod 0755, "#{bin}/384"
    end

    #test do
    #  # Replace 'script1' and the expected output as per your script's functionality
    #  output = shell_output("#{bin}/script1 --version")
    #  assert_match "0.2.5", output
    #end
  end
  
