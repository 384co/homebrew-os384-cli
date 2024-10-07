# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://github.com/384co/homebrew-os384-cli"
    url "https://github.com/384co/homebrew-os384-cli/archive/refs/tags/1.0.36.tar.gz"
    sha256 "bf09f7094e9260ca4d5c2e6b7bf23f431322136c66252918536c5b6dc992b408"
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
      assert_match "1.0.0", output
    end
  end
  