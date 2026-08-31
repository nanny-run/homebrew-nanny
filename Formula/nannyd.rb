# Homebrew formula for the Nanny CLI.
#
# This file lives at homebrew/nannyd.rb in the nanny repo for source tracking.
# For the tap to work, copy it to the Formula/ directory of the
# nanny-run/homebrew-nanny GitHub repository:
#
#   https://github.com/nanny-run/homebrew-nanny/blob/main/Formula/nannyd.rb
#
# After tagging v0.1.0, update the sha256 values using:
#   curl -fsSL <url> | shasum -a 256
#   NOTE: SHA256 values are updated automatically by CI, no manual steps required.

class Nannyd < Formula
  desc "Execution boundary for autonomous AI agents"
  homepage "https://nanny.run"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-arm64.tar.gz"
      sha256 "977b40e6ee9b5aab1cbd0d83472e687715e6b8b8e77d6be697d37edbae3e9796"
    end

    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-x86_64.tar.gz"
      sha256 "da6b69f309b147bc1a2c98599b0e705b755ad9f819604b723907cc5061643e6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-linux-x86_64.tar.gz"
      sha256 "2ea8941a8edf79bfc69b838dc164d7c54105fd45123deae8dd8b5b4a5193812e"
    end
  end

  def install
    bin.install "nanny"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanny --version")
  end
end
