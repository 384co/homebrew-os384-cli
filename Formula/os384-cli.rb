# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.1.1"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.1.1.tar.gz"
    sha256 "93306e22af070b624405c513e10c2b7619d169cb0578386a7a6592944791762b"
    license "GPL-3.0-only"
  
    depends_on "deno"
  
    def install
        # Directly install executable .ts scripts into bin
        bin.install Dir["src/*.ts"]
    
        # Ensure scripts have executable permissions
        chmod 0755, Dir["#{bin}/*.ts"]
      end    
  
    #test do
    #  # Replace 'script1' and the expected output as per your script's functionality
    #  output = shell_output("#{bin}/script1 --version")
    #  assert_match "0.1.1", output
    #end
  end
  
