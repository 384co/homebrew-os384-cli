# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://github.com/384co/homebrew-os384-cli"
    url "https://github.com/384co/homebrew-os384-cli/archive/refs/tags/1.0.35.tar.gz"
    sha256 "2d7ee87eab0e4305e563d07a0ec68456a27bc0bcd28d7eb607c51020d8d19d75"
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
  