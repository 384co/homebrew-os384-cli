# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.0.10"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.0.10.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
      assert_match "0.0.10", output
    end
  end
  
