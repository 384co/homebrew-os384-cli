# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.1.0"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.1.0.tar.gz"
    sha256 "520de148842ace6142e2e30d42ba7a14cc99287bd1721fb3ba0e7bf6f88bac84"
    license "MIT"
  
    depends_on "deno"
  
    def install
        # Directly install executable .ts scripts into bin
        bin.install Dir["scripts/*.ts"]
    
        # Ensure scripts have executable permissions
        chmod 0755, Dir["#{bin}/*.ts"]
      end    
  
    test do
      # Replace 'script1' and the expected output as per your script's functionality
      output = shell_output("#{bin}/script1 --version")
      assert_match "0.1.0", output
    end
  end
  
