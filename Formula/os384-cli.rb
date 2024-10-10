# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.1.8"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.1.8.tar.gz"
    sha256 "d614e733cfcca8615dff1443b46d1dd4b83bfee1e2e651157dc81cfa70a92c55"
    license "GPL-3.0-only"
  
    depends_on "deno"
  
    def install
      # Directly install executable .ts scripts into bin
      bin.install Dir["src/*.ts"]
    
      # Ensure scripts have executable permissions
      chmod 0755, Dir["#{bin}/*.ts"]

      # Also install the convenience script, which doesn't have a suffix
      bin.install "src/os384"
      chmod 0755, "#{bin}/os384"
    end

    #test do
    #  # Replace 'script1' and the expected output as per your script's functionality
    #  output = shell_output("#{bin}/script1 --version")
    #  assert_match "0.1.8", output
    #end
  end
  
