# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.1.2"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.1.2.tar.gz"
    sha256 "474ef72d394f004171281beb6d11fa90f8a10f6aaec79c2914359b3d261e6662"
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
    #  assert_match "0.1.2", output
    #end
  end
  
