# Formula/os384-cli.rb
class Os384Cli < Formula
    desc "os384 command line utilities"
    homepage "https://384.co/"
    version "0.2.3"
    url "https://github.com/384co/384-cli-tools/archive/refs/tags/0.2.3.tar.gz"
    sha256 "fccb37271d0a164768b6376b25af4a0b3c1146736fb9c633cfae79b778237cb6"
    license "GPL-3.0-only"
  
    depends_on "deno"
  
    def install
      # Directly install executable .ts scripts into bin
      bin.install Dir["src/*.ts"]

      # Ditto for the packaged lib384 parts
      bin.install Dir["src/384.esm.js"]
      bin.install Dir["src/384.esm.d.ts"]
    
      # Ensure scripts have executable permissions
      chmod 0755, Dir["#{bin}/*.ts"]

      # Also install the convenience script, which doesn't have a suffix
      bin.install "src/384"
      chmod 0755, "#{bin}/384"
    end

    #test do
    #  # Replace 'script1' and the expected output as per your script's functionality
    #  output = shell_output("#{bin}/script1 --version")
    #  assert_match "0.2.3", output
    #end
  end
  
